import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String logo;
  final String lastNumbers;
  final String owner;
  final String endDate;
  final Color color;
  bool isExpanded;

  CardItem(
    this.id,
    this.logo,
    this.lastNumbers,
    this.owner,
    this.endDate,
    this.color,
    this.isExpanded,
  );

  static CardItem createVisa(String id) => CardItem(
        id,
        'images/visa.png',
        '1234',
        'AGAFIA AMELOVA',
        '03/24',
        const Color(0xFFF48FB1),
        false,
      );
}
