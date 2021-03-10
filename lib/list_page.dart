import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/wallet_element.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.items}) : super(key: key);

  final List<CardItem> items;

  @override
  _ListPageState createState() => _ListPageState(items);
}

class _ListPageState extends State<ListPage> {
  List<CardItem> items;

  _ListPageState(this.items);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Wallet'),
        leading: Icon(Icons.account_balance_wallet_outlined),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CardWidget(
            item: items[index],
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
          );
        },
      ),
    );
  }
}
