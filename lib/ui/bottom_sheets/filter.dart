import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? _selectedIndex = 0;
  double lowestPricesValue = 2000;
  List<Map<String, dynamic>> data = [
    {
      'title': earlyMorning,
      'icon': 'assets/icons/earlymorning.png',
      'subtitle': fourToSeven
    },
    {
      'title': morning,
      'icon': 'assets/icons/morning.png',
      'subtitle': sevenToTwelve
    },
    {
      'title': afternoon,
      'icon': 'assets/icons/afternoon.png',
      'subtitle': twelveToFive
    }
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(thirtyDp),
                topRight: Radius.circular(thirtyDp))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(eightDp),
              child: Text(
                filter,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: eighteenDp,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Divider(
              thickness: 1,
            ),
            Container(
              height: fortyEightDp,
              margin: EdgeInsets.symmetric(horizontal: sixteenDp),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                border: Border.all(width: 1, color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(eightDp),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(tenDp),
                  color: Colors.white,
                ),
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: lowestPrices,
                  ),
                  Tab(
                    text: highestRated,
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
              children: [
                buildFilterItems(),
                buildFilterItems(),
              ],
              controller: _tabController,
            ))
          ],
        ),
      ),
    );
  }

  Widget buildFilterItems() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: sixteenDp, vertical: sixteenDp),
                    child: Text(
                      time,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  // buildTimeSelection('args1', 'assets/images/a.png', 'args2'),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: data
                          .asMap()
                          .entries
                          .map((e) => buildTimeSelection(e.key))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: twentyDp, top: sixteenDp),
                    child: Text(
                      price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Slider(
                    value: lowestPricesValue,
                    onChanged: (double value) {
                      print('$value');
                      setState(() {
                        lowestPricesValue = value;
                      });
                    },
                    min: 2000.0,
                    max: 10000.0,
                    divisions: 10,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.grey,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: fourDp),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'N',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: CustomColors.blackCurrency,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mulish',
                                      fontSize: sixteenDp)),
                              WidgetSpan(
                                child: Text(
                                  '5000',
                                  //superscript is usually smaller in size
                                  style: TextStyle(
                                      color: CustomColors.blackCurrency,
                                      fontWeight: FontWeight.w400,
                                      fontSize: fifteenDp),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'N',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: CustomColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Mulish',
                                    fontSize: sixteenDp)),
                            WidgetSpan(
                              child: Text(
                                '30,000',
                                //superscript is usually smaller in size
                                style: TextStyle(
                                    color: CustomColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: fifteenDp),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: sixteenDp, vertical: sixteenDp),
                  height: fiftyTwoDp,
                  decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(0.04),
                      border: Border.all(width: 1.2, color: Colors.teal)),
                  // margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                  child: Center(
                    child: Text(
                      showTen,
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: twentyDp),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget buildTimeSelection(int index) {
    return GestureDetector(
      onTap: () {
        _selectedIndex = index;
        setState(() {});
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: sixteenDp),
        width: oneTwentyDp,
        height: ninetyDp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(eightDp),
            border: Border.all(
                color: _selectedIndex == index ? Colors.teal : Colors.grey,
                width: _selectedIndex == index ? 0.8 : 0.2)),
        duration: Duration(milliseconds: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(eightDp),
              child: Text(
                data.toList()[index]['title'],
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(
              data.toList()[index]['icon'],
              width: twentyFourDp,
            ),
            Padding(
              padding: const EdgeInsets.all(eightDp),
              child: Text(
                data.toList()[index]['subtitle'],
                style: TextStyle(
                    color: CustomColors.grayMedium, fontSize: twelveDp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
