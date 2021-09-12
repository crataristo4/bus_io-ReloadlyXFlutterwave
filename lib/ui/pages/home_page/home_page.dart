import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/ui/pages/search_results/search_results_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/destination_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  static String fromLocation = whereAreYouLeavingFrom;
  static String toLocation = whereAreYouGoingTo;

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noOfPassengerController = TextEditingController();
  String? today;
  DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  DateTime _dateTime = DateTime.now();

  //get date
  Future<DateTime?> _selectDate(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100));

  @override
  void initState() {
    today = _dateFormat.format(_dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: sixteenDp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sixteenDp,
              ),
              Text(
                goodDay,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: twentyFourDp,
                    color: Colors.black),
              ),
              SizedBox(
                height: fourDp,
              ),
              Text(
                whereAreYouHeaded,
                style: TextStyle(fontSize: fourteenDp, color: Colors.black),
              ),
              SizedBox(
                height: twentyDp,
              ),
              DestinationCard(
                from: whereAreYouLeavingFrom,
                to: whereAreYouGoingTo,
                color: Colors.grey,
              ),
              SizedBox(
                height: twentyDp,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 0,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final selectedDate = await _selectDate(context);
                      if (selectedDate == null) return;
                      _dateTime = DateTime(
                        selectedDate.day,
                        selectedDate.month,
                        selectedDate.year,
                      );
                      today = _dateFormat.format(_dateTime);

                      setState(() {});
                    },
                    child: buildSecondCard(
                        date, 'assets/icons/calender.png', Text('$today')),
                  ),
                  buildSecondCard(noOfPassengers, 'assets/icons/person.png',
                      buildNoOfPassengerInput()),
                ],
              ),
              SizedBox(
                height: twentyDp,
              ),
              ButtonWidget(
                  buttonName: findBuses,
                  onButtonTapped: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SearchResultsPage()));
                  }),
              SizedBox(
                height: twentyDp,
              ),
              Divider(),
              SizedBox(
                height: tenDp,
              ),
              Text(
                quickBookings,
                style:
                    TextStyle(fontSize: twentyDp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: sixteenDp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildQuickBookings(lagosToAccra, '09/10/2021'),
                  buildQuickBookings(lagosToBenin, '09/10/2021'),
                ],
              ),
              SizedBox(
                height: sixteenDp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildQuickBookings(accraToLome, '09/10/2021'),
                  buildQuickBookings(lomeToYaounde, '09/10/2021'),
                ],
              ),
              SizedBox(
                height: sixteenDp,
              ),
              buildLoyaltyCard(),
              SizedBox(
                height: sixteenDp,
              ),
            ],
          ),
        ),
      ),
    );
  }

/*
  //destination card
  Widget buildDestinationCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(tenDp)),
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
                            Navigator.of(context).pushNamed(SearchBus.routeName,
                                arguments: false);
                          },
                          child: Text(
                            HomePage.fromLocation,
                            style: TextStyle(
                                color: Colors.grey,
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
                            Navigator.of(context).pushNamed(SearchBus.routeName,
                                arguments: true);
                          },
                          child: Text(
                            HomePage.toLocation,
                            style: TextStyle(
                                color: Colors.grey,
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
    );
  }
*/

  Widget buildNoOfPassengerInput() {
    return Container(
      width: hundredDp,
      child: TextFormField(
          keyboardType: TextInputType.numberWithOptions(decimal: false),
          textAlign: TextAlign.center,
          controller: noOfPassengerController,
          validator: (value) => value!.trim().isNotEmpty || int.parse(value) > 0
              ? null
              : requireD,
          decoration: InputDecoration(
            hintText: "1",
            fillColor: CustomColors.lightTeal.withOpacity(0.4),
            filled: false,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: 0, horizontal: tenDp),
          )),
    );
  }

  //date card
  Widget buildSecondCard(String title, String icon, Widget widget) {
    return Container(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: tenDp),
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: sixteenDp),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(tenDp),
            ),
            child: Container(
              height: fiftyTwoDp,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(eightDp),
                    child: Image.asset(icon),
                  ),
                  widget
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //quick bookings
  Widget buildQuickBookings(title, date) {
    return Container(
      padding: EdgeInsets.all(tenDp),
      decoration: BoxDecoration(
          color: Colors.tealAccent.withOpacity(0.05),
          borderRadius: BorderRadius.circular(tenDp)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: eightDp, vertical: twelveDp),
            child: Image.asset('assets/icons/bus.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: eightDp),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: sixteenDp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: fourDp,
              ),
              Text(
                date,
                style: TextStyle(color: Colors.black45, fontSize: fourteenDp),
              ),
            ],
          )
        ],
      ),
    );
  }

  //loyalty card
  Widget buildLoyaltyCard() {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(tenDp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/icons/loyalty.png'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: tenDp, bottom: tenDp),
                    child: Text(
                      loyaltyRewardPlan,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.llColor,
                          fontFamily: 'Roboto Slab'),
                    ),
                  ),
                  SizedBox(
                    width: twoHundredDp,
                    child: Text(
                      loyaltyRewardPlanDes,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: CustomColors.llColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Image.asset('assets/icons/arrow_right.png'),
          ),
        ],
      ),
    );
  }
}
