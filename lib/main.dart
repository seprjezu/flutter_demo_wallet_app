import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.white),
      home: ListPage(items: [
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
      ]),
    );
  }
}
