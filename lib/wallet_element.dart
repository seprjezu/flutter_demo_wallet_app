import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_wallet_app/data.dart';

class CardBackplate extends StatelessWidget {
  final Widget child;
  final Color startColor;
  final Color endColor;
  final bool isSelected;

  CardBackplate({
    Key key,
    this.child,
    this.startColor,
    this.endColor,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: endColor,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [startColor, endColor]),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 8.0,
          right: 8.0,
        ),
        child: child,
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  final String lastNumbers;

  CardNumber({Key key, @required this.lastNumbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stars(),
        Stars(),
        Stars(),
        Text(
          lastNumbers,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontFamily: 'Karla',
          ),
        ),
      ],
    );
  }
}

class Stars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '****',
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.white.withOpacity(0.3),
        fontFamily: 'Karla',
      ),
    );
  }
}

class BottomImageClipper extends CustomClipper<Rect> {
  double _factor;

  BottomImageClipper(this._factor);

  @override
  Rect getClip(Size size) =>
      Rect.fromLTRB(0, 0, size.width, size.height * _factor);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class CardWidget extends StatefulWidget {
  final CardItem item;
  final void Function(CardItem cardItem) changeCallback;
  final ValueChanged<CardItem> onOpenCard;
  const CardWidget({Key key, this.item, this.changeCallback, this.onOpenCard}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with TickerProviderStateMixin {
  static const duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.item.isExpanded = !widget.item.isExpanded;
          widget.changeCallback(widget.item);
        });
      },
      child: CardBackplate(
        startColor: widget.item.startColor,
        endColor: widget.item.endColor,
        isSelected: widget.item.isExpanded,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.item.logo,
                  width: 48.0,
                  height: 32.0,
                  color: Colors.white,
                ),
                TextButton(
                  onPressed: () {
                   widget.onOpenCard(widget.item);
                  },
                  child: Text(
                    "DETAILS",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontFamily: 'Karla',
                    ),
                  ),
                )
              ],
            ),
            AnimatedSize(
              duration: duration,
              vsync: this,
              child: widget.item.isExpanded
                  ? SizedBox.fromSize(
                      size: Size.fromHeight(16.0),
                    )
                  : const SizedBox(width: 0, height: 0),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 8,
                right: 16,
              ),
              child: CardNumber(lastNumbers: widget.item.lastNumbers),
            ),
            AnimatedOpacity(
              opacity: widget.item.isExpanded ? 1.0 : 0.0,
              duration: duration,
              child: AnimatedSize(
                duration: duration,
                vsync: this,
                child: widget.item.isExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 8,
                          right: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.owner,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontFamily: 'Karla',
                              ),
                            ),
                            Text(
                              widget.item.endDate,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontFamily: 'Karla',
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(
                        width: double.infinity,
                        height: 0,
                      ),
              ),
            ),
            AnimatedSize(
              duration: duration,
              vsync: this,
              child: widget.item.isExpanded
                  ? SizedBox.fromSize(
                      size: Size.fromHeight(16.0),
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: 0,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  heightFactor: 0.66,
                  alignment: Alignment.topCenter,
                  child: ClipRect(
                    clipper: BottomImageClipper(0.66),
                    child: Image.asset(
                      widget.item.logo,
                      height: 64.0,
                      width: 120.0,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
