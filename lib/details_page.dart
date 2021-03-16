import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_wallet_app/data.dart';
import 'package:flutter_demo_wallet_app/wallet_element.dart';

class DetailsPage extends StatefulWidget {
  final CardItem cardItem;

  DetailsPage({this.cardItem});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  static const duration = const Duration(milliseconds: 400);
  int _currentMonthsPage = 0;
  int _currentActionsPage = 0;
  double _currentMonthsPageDouble;
  double _currentActionsPageDouble;
  CarouselController monthsController;
  CarouselController actionsController;

  double _incomeOpacity = 0.0;
  double _datesOpacity = 0.0;
  double _actionsOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    monthsController = CarouselControllerImpl();
    actionsController = CarouselControllerImpl();

    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        monthsController.jumpToPage(3);
        actionsController.jumpToPage(3);
      });
    });
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _incomeOpacity = 1.0;
      });
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _datesOpacity = 1.0;
        });
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            _actionsOpacity = 1.0;
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          children: [
            Column(
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
                              widget.cardItem.startColor,
                              widget.cardItem.endColor,
                              false,
                            )
                          : widget.cardItem,
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  curve: Curves.easeInOut,
                  duration: Duration(seconds: 1),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (BuildContext context, double value, Widget child) {
                    return Transform.scale(
                      child: child,
                      scale: value,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _incomeOpacity,
                    duration: duration,
                    child: Container(
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
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
                  ),
                ),
                TweenAnimationBuilder(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 1500),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (BuildContext context, double value, Widget child) {
                    return Transform.scale(
                      child: child,
                      scale: value,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _datesOpacity,
                    duration: duration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: CarouselSlider.builder(
                          carouselController: monthsController,
                          itemCount: months.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              child: Center(
                                child: Transform.scale(
                                  scale: _currentMonthsPageDouble != null
                                      ? 1.7 -
                                          (realIndex - _currentMonthsPageDouble)
                                              .abs()
                                      : 1.7,
                                  child: Text(
                                    months[index],
                                    style: TextStyle(
                                      fontFamily: 'Karla',
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                if (reason !=
                                    CarouselPageChangedReason.controller) {
                                  setState(() {
                                    _currentMonthsPage = index;
                                    actionsController
                                        .animateToPage(_currentMonthsPage);
                                  });
                                }
                              },
                              onScrolled: (page) {
                                setState(() {
                                  _currentMonthsPageDouble = page;
                                });
                              },
                              height: 50,
                              initialPage: 1,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              viewportFraction: 0.3),
                        ),
                      ),
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 1700),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (BuildContext context, double value, Widget child) {
                    return Transform.scale(
                      child: child,
                      scale: value,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: duration,
                    opacity: _actionsOpacity,
                    child: Container(
                        alignment: Alignment.center,
                        child: CarouselSlider.builder(
                          carouselController: actionsController,
                          itemCount: months.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              child: Center(
                                child: Transform.scale(
                                  scale: _currentActionsPageDouble != null
                                      ? 1 -
                                          (realIndex -
                                                  _currentActionsPageDouble)
                                              .abs()
                                      : 1,
                                  child: ActionCard(),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                              aspectRatio: 1,
                              initialPage: 1,
                              onPageChanged: (index, reason) {
                                if (reason !=
                                    CarouselPageChangedReason.controller) {
                                  setState(() {
                                    _currentActionsPage = index;
                                    monthsController
                                        .animateToPage(_currentActionsPage);
                                  });
                                }
                              },
                              onScrolled: (page) {
                                setState(() {
                                  _currentActionsPageDouble = page;
                                });
                              },
                              viewportFraction: 0.9),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          shape: BoxShape.rectangle,
        ),
        padding: const EdgeInsets.only(top: 8),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Action(
                icon: Icons.monetization_on_outlined,
                iconColor: Colors.blue[300],
                title: "Visa",
                date: "4 SEPTEMBER",
                money: "12,333.0",
                isIncome: true,
              ),
              Action(
                icon: Icons.shopping_cart_outlined,
                iconColor: Colors.lightGreen[300],
                title: "Shopping",
                date: "6 SEPTEMBER",
                money: "234.5",
                isIncome: false,
              ),
              Action(
                icon: Icons.car_rental,
                iconColor: Colors.red[300],
                title: "Car",
                date: "13 SEPTEMBER",
                money: "2,123.0",
                isIncome: false,
              ),
              Action(
                icon: Icons.monetization_on_outlined,
                iconColor: Colors.blue[300],
                title: "Visa",
                date: "23 SEPTEMBER",
                money: "1,243.0",
                isIncome: true,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}

class Action extends StatelessWidget {
  Action({
    this.icon,
    this.iconColor,
    this.title,
    this.date,
    this.money,
    this.isIncome,
  });

  final IconData icon;
  final Color iconColor;

  final String title;
  final String date;
  final String money;
  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    icon,
                    size: 32,
                    color: iconColor,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                            ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "\$ $money",
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: isIncome
                      ? Icon(
                          Icons.trending_up,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.trending_down_outlined,
                          color: Colors.red,
                        ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

List<String> months = [
  "JANUARY",
  "FEBRUARY",
  "MARCH",
  "APRIL",
  "MAY",
  "JUNE",
  "JULY",
  "AUGUST",
  "SEPTEMBER",
  "OCTOBER",
  "NOVEMBER",
  "DECEMBER"
];
