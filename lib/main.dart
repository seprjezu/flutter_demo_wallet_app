import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/card_page.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/list_page.dart';

List<CardItem> items = [
  CardItem(
    'visa',
    'images/visa.png',
    '1234',
    'AGAFIA AMELOVA',
    '03/24',
    Colors.pink,
    Colors.pink[100],
    false,
  ),
  CardItem(
    'mir',
    'images/mir.png',
    '4321',
    'IVAN PETROV',
    '01/44',
    Colors.brown[300],
    Colors.brown[600],
    false,
  ),
  CardItem(
    'mastercard',
    'images/mastercard.png',
    '4221',
    'ARTUR CHERNOV',
    '14/09',
    Colors.red,
    Colors.blue,
    false,
  ),
  CardItem(
    'sber',
    'images/sber.png',
    '5782',
    'LISA SU',
    '13/24',
    Colors.green[300],
    Colors.green[600],
    false,
  ),
];

void main() {
  runApp(MyApp());
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

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
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
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
                items: List.from(items),
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
