import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/wallet_element.dart';

class DetailsPage extends StatefulWidget {
  final CardItem cardItem;

  DetailsPage({this.cardItem});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                  right: 32.0,
                  left: 32.0,
                  bottom: 8.0,
                ),
                child: Hero(
                  tag: widget.cardItem.id,
                  child: CardWidget(
                    item: widget.cardItem.isExpanded
                        ? CardItem(
                            widget.cardItem.id,
                            widget.cardItem.logo,
                            widget.cardItem.lastNumbers,
                            widget.cardItem.owner,
                            widget.cardItem.endDate,
                            widget.cardItem.color,
                            false)
                        : widget.cardItem,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              'INCOME',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              '\$ 3,200,000',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontFamily: 'Karla',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: SizedBox(
                              height: 2,
                              width: 40,
                              child: ColoredBox(
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              'SPENT',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              '\$ 1,400,000',
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.black,
                                fontFamily: 'Karla',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: SizedBox(
                              height: 2,
                              width: 40,
                              child: ColoredBox(
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
