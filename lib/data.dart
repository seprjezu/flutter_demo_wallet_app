import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String logo;
  final String lastNumbers;
  final String owner;
  final String endDate;
  final Color endColor;
  final Color startColor;
  bool isExpanded;

  CardItem(
    this.id,
    this.logo,
    this.lastNumbers,
    this.owner,
    this.endDate,
    this.startColor,
    this.endColor,
    this.isExpanded,
  );
}
