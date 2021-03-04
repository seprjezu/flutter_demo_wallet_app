import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MiniCardElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.pink[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 8.0,
            right: 8.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/visa.png',
                width: 48.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 8,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '****',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Karla',
                      ),
                    ),
                    Text(
                      '****',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Karla',
                      ),
                    ),
                    Text(
                      '****',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white.withOpacity(0.3),
                        fontFamily: 'Karla',
                      ),
                    ),
                    Text(
                      '1234',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: 'Karla',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    heightFactor: 0.66,
                    widthFactor: 0.8,
                    alignment: Alignment.topCenter,
                    child: ClipRect(
                      clipper: BottomImageClipper(0.66),
                      child: Image.asset(
                        'images/visa.png',
                        height: 64.0,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomImageClipper extends CustomClipper<Rect> {
  double _factor;

  BottomImageClipper(this._factor);

  @override
  Rect getClip(Size size) => Rect.fromLTRB(0, 0, size.width, size.height * _factor);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class ExpandedCardElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
