import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/details_page.dart';

class CardDetailsMaterialPage extends Page {
  final CardItem cardItem;

  CardDetailsMaterialPage({
    this.cardItem,
  }) : super(key: ValueKey(cardItem));

  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: Duration(milliseconds: 600),
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: 0.0, end: 1.0);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return FadeTransition(
          opacity: animation.drive(curveTween).drive(tween),
          child: DetailsPage(
            cardItem: cardItem,
          ),
        );
      },
    );
  }
}
