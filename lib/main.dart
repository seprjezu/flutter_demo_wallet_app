import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/card_page.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/details_page.dart';
import 'package:flutter_demo_wallet_app/list_page.dart';

List<CardItem> items = [
  CardItem.createVisa('1'),
  CardItem.createVisa('2'),
  CardItem.createVisa('3'),
  CardItem.createVisa('4'),
  CardItem.createVisa('5'),
  CardItem.createVisa('6'),
  CardItem.createVisa('7'),
  CardItem.createVisa('8'),
  CardItem.createVisa('9'),
  CardItem.createVisa('10'),
  CardItem.createVisa('11'),
  CardItem.createVisa('12'),
  CardItem.createVisa('13'),
  CardItem.createVisa('14'),
  CardItem.createVisa('15'),
  CardItem.createVisa('16'),
  CardItem.createVisa('17'),
  CardItem.createVisa('19'),
  CardItem.createVisa('20'),
  CardItem.createVisa('21'),
  CardItem.createVisa('22'),
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CardItem _selectedCard;
  final heroC = HeroController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.white),
      home: WillPopScope(
        onWillPop: () async {
          if (_selectedCard != null) {
            setState(() {
              _selectedCard = null;
            });
            return false;
          } else {
            return true;
          }
        },
        child: Navigator(
          observers: [
            heroC,
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            // Update the list of pages by setting _selectedCard to null
            setState(() {
              _selectedCard = null;
            });

            return true;
          },
          pages: [
            MaterialPage(
              key: ValueKey('ListPage'),
              child: ListPage(
                items: items,
                onTapped: _handleCardTapped,
              ),
            ),
            if (_selectedCard != null)
              CardDetailsMaterialPage(
                  cardItem: _selectedCard,
                ),
          ],
        ),
      ),
    );
  }

  _handleCardTapped(CardItem cardItem) {
    setState(() {
      _selectedCard = cardItem;
    });
  }
}
