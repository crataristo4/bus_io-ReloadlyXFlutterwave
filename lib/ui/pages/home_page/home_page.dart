import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/user.dart';
import 'package:bus_io/services/user_service.dart';
import 'package:bus_io/ui/pages/search_bus/bus_results_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/destination_card.dart';
import 'package:bus_io/ui/widgets/option_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('dd/MM/yyyy');
DateTime dateTime = DateTime.now();

class HomePage extends StatefulWidget {
  static const String routeName = "/homepage";
  static String fromLocation = whereAreYouLeavingFrom;
  static String toLocation = whereAreYouGoingTo;

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noOfPassengerController = TextEditingController();
  String? today;
  String? message;

  @override
  void initState() {
    today = dateFormat.format(dateTime);
    greetingMessage();
    super.initState();
  }

  //greeting message to user
  greetingMessage() {
    var timeNow = DateTime.now().hour;
    if (timeNow < 12) {
      setState(() {
        message = goodMorning;
      });
    } else if ((timeNow >= 12) && (timeNow <= 16)) {
      setState(() {
        message = goodAfternoon;
      });
    } else if ((timeNow > 16) && (timeNow <= 20)) {
      setState(() {
        message = goodEvening;
      });
    } else {
      setState(() {
        message = goodNight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<Users>(
          stream: UserService.instance.getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Users users = Users.fromJson(snapshot.data!.toJson());

              return SingleChildScrollView(
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
                        "$message ${users.firstName}",
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
                        style: TextStyle(
                            fontSize: fourteenDp, color: Colors.black),
                      ),
                      SizedBox(
                        height: twentyDp,
                      ),
                      DestinationCard(
                        isCard: true,
                        from: users.from.toString().isEmpty
                            ? whereAreYouLeavingFrom
                            : users.from.toString(),
                        to: users.to.toString().isEmpty
                            ? whereAreYouGoingTo
                            : users.to.toString(),
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
                              final selectedDate =
                                  await ShowAction().selectDate(context);
                              if (selectedDate == null) return;
                              dateTime = DateTime(
                                selectedDate.day,
                                selectedDate.month,
                                selectedDate.year,
                              );
                              setState(() {
                                today = dateFormat.format(dateTime);
                              });

                              print('?? $today');
                            },
                            child: OptionSelector(
                              title: date,
                              icon: 'assets/icons/calender.png',
                              widget: Text('$today'),
                              textColor: Colors.black,
                            ),
                          ),
                          OptionSelector(
                            title: noOfPassengers,
                            icon: 'assets/icons/person.png',
                            widget: buildNoOfPassengerInput(),
                            textColor: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: twentyDp,
                      ),
                      ButtonWidget(
                          buttonName: findBuses,
                          onButtonTapped: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BusResultsPage()));
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
                        style: TextStyle(
                            fontSize: twentyDp, fontWeight: FontWeight.bold),
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
              );
            }
          }),
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
