import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/wallet_element.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.items, this.onTapped}) : super(key: key);
  final ValueChanged<CardItem> onTapped;
  final List<CardItem> items;

  @override
  _ListPageState createState() => _ListPageState(List.from(items));
}

class _ListPageState extends State<ListPage> {
  List<CardItem> items;

  _ListPageState(this.items);

  Widget _flightShuttleBuilder(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext,
      ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Wallet'),
            GestureDetector(
              onTap: () {
                setState(() {
                  items = List.from(widget.items);
                });
              },
              child: Icon(Icons.replay_sharp),
            )
          ],
        ),
        leading: Icon(Icons.account_balance_wallet_outlined),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              child: Icon(CupertinoIcons.trash),
            ),
            onDismissed: (direction) => setState(() {
              items.removeAt(index);
            }),
            key: Key(item.id),
            child: Hero(
              flightShuttleBuilder: _flightShuttleBuilder,
              tag: item.id,
              child: CardWidget(
                item: item,
                changeCallback: (item) {
                  if (item.isExpanded) {
                    setState(() {
                      items = items.map((e) {
                        if (e.isExpanded && e.id != item.id) {
                          e.isExpanded = false;
                        }
                        return e;
                      }).toList();
                    });
                  }
                },
                onOpenCard: widget.onTapped,
              ),
            ),
          );
        },
      ),
    );
  }
}
