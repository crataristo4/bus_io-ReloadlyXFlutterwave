import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/ui/pages/search_city/search_city_page.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatefulWidget {
  final to, from;
  final Color color;
  final isCard;

  const DestinationCard(
      {Key? key,
      required this.from,
      required this.to,
      required this.color,
      required this.isCard})
      : super(key: key);

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  @override
  Widget build(BuildContext context) {
    return widget.isCard
        ? Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(tenDp)),
            child: Container(
              height: 140,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: twentyDp, horizontal: twentyDp),
                          child: Column(
                            children: [
                              Image.asset('assets/icons/greencircle.png'),
                              Image.asset('assets/icons/line.png'),
                              Image.asset('assets/icons/greencircle.png')
                            ],
                          )),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: twentyDp),
                              child: Text(
                                from,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: twelveDp),
                              child: GestureDetector(
                                onTap: () {
                                  //push to search page
                                  Navigator.of(context).pushNamed(
                                      SearchCity.routeName,
                                      arguments: false);
                                },
                                child: Text(
                                  widget.from,
                                  style: TextStyle(
                                      color: widget.color,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: twelveDp),
                              child: Text(
                                to,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: twelveDp),
                              child: GestureDetector(
                                onTap: () {
                                  //push to search page
                                  Navigator.of(context).pushNamed(
                                      SearchCity.routeName,
                                      arguments: true);
                                },
                                child: Text(
                                  widget.to,
                                  style: TextStyle(
                                      color: widget.color,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Image.asset('assets/icons/arrow.png'),
                    padding: EdgeInsets.only(right: thirtyDp),
                  )
                ],
              ),
            ),
          )
        : Container(
            height: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        child: Column(
                          children: [
                            Image.asset('assets/icons/greencircle.png'),
                            Image.asset('assets/icons/line.png'),
                            Image.asset('assets/icons/greencircle.png')
                          ],
                        )),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2, left: eightDp),
                            child: Text(
                              from,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: twelveDp, left: eightDp),
                            child: GestureDetector(
                              onTap: () {
                                //push to search page
                                Navigator.of(context).pushNamed(
                                    SearchCity.routeName,
                                    arguments: false);
                              },
                              child: Text(
                                widget.from,
                                style: TextStyle(
                                    color: widget.color,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: twelveDp, left: eightDp),
                            child: Text(
                              to,
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: twelveDp, left: eightDp),
                            child: GestureDetector(
                              onTap: () {
                                //push to search page
                                Navigator.of(context).pushNamed(
                                    SearchCity.routeName,
                                    arguments: true);
                              },
                              child: Text(
                                widget.to,
                                style: TextStyle(
                                    color: widget.color,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset('assets/icons/arrow.png'),
                  padding: EdgeInsets.only(right: tenDp),
                )
              ],
            ),
          );
  }
}
