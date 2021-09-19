import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/pages/home_page/home_page.dart';
import 'package:bus_io/ui/widgets/bookings_item.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/option_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  String? today;

  @override
  void initState() {
    today = dateFormat.format(dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(sixteenDp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await ShowAction().selectDate(context);
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
                    title: from,
                    icon: 'assets/icons/calender.png',
                    widget: Text('$today'),
                    textColor: Colors.black45,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await ShowAction().selectDate(context);
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
                    title: to,
                    icon: 'assets/icons/calender.png',
                    widget: Text('08/10/2021'),
                    textColor: Colors.black45, //todo change date
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
            child: ButtonWidget(buttonName: search, onButtonTapped: () {}),
          ),
          /*Padding(
            padding: const EdgeInsets.only(top: thirtyDp, bottom: sixteenDp),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svg/nobooking.svg',
                  placeholderBuilder: (BuildContext context) => Container(),
                ),
                    SizedBox(height: twentyDp,),
                    Text(
                      noPreviousBooking,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: twentyDp),
                    ),
                    SizedBox(height: tenDp,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: thirtyDp),
                      child: Text(
                    whenBusesAreBooked,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: Colors.black45, fontSize: sixteenDp),
                  ),
                ),
              ],
            )),
          )*/

          //todo fetched once user books
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                Bookings bookings = bookingList[index];
                return BookingsItem(
                  bookings: bookings,
                  containerBgColor: CustomColors.teal,
                  iconData: "\$",
                  iconDataColor: Colors.tealAccent.withOpacity(0.4),
                  onTap: () {
                   //todo
                  },
                  textExtra: "",
                  buttonName: reviewThisTicket,
                  text: "${bookings.bookingDate}",
                  isTicket: false,
                );
              },
              shrinkWrap: true,
              primary: true,
              itemCount: bookingList.length,
              physics: ClampingScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }

  //list of bookings
  Widget bookingWidget(Bookings bookings) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.69),
          borderRadius: BorderRadius.circular(twentyDp)),
      margin: EdgeInsets.symmetric(vertical: sixteenDp, horizontal: sixteenDp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: fourDp, top: eightDp),
                    child: Image.asset(
                      bookings.bus.busImage,
                      width: thirtyDp,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: sixDp, top: fourteenDp),
                    child: Text(
                      bookings.bus.source.toString().toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: tenDp, right: sixteenDp),
                child: Text(
                  '${bookings.bookingDate}',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomColors.grayMedium),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),

          //day and bus name
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: sixteenDp,
                ),
                child: Text(
                  from,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: fourteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: twelveDp),
                child: Text(
                  bookings.bus.busName,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: fourteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          //location and seats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: sixteenDp),
                child: Text('${bookings.from} ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mulish',
                        fontSize: sixteenDp)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: eightDp),
                child: Text(
                  "${bookings.bus.numberOfSeats} Seats",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
            child: Text(to,
                style: TextStyle(
                    color: CustomColors.grayMedium,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mulish',
                    fontSize: sixteenDp)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
            child: Text(
              bookings.to,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: fifteenDp),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: sixteenDp, top: twentyDp, bottom: tenDp),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/free.png',
                      width: 120,
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: tenDp,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: sixteenDp),
                    child: Text(
                      priceTicket,
                      style: TextStyle(color: CustomColors.grayMedium),
                    ),
                  ),
                  SizedBox(
                    height: fourDp,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'N',
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              // fontFamily: 'Mulish',
                              fontSize: sixteenDp)),
                      WidgetSpan(
                        child: Text(
                          '${bookings.bus.price}',
                          //superscript is usually smaller in size
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w500,
                              fontSize: fifteenDp),
                        ),
                      ),
                    ]),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: tenDp,
          ),

          Image.asset('assets/images/line.png'),

          SizedBox(
            height: twelveDp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: fourDp,
                      ),
                      child: Text(
                        "${bookings.details.length} $seats",
                        style: TextStyle(
                            color: CustomColors.grayMedium,
                            fontSize: fourteenDp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                      ),
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: Text(
                          "${bookings.details.map((e) => e.seatNo)}",
                          style: TextStyle(
                              color: CustomColors.black,
                              fontSize: sixteenDp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: sixteenDp, bottom: tenDp, top: tenDp),
                  child: Text(
                    ticketDetails,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: sixteenDp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                //proceed to review bookings
              },
              child: Container(
                height: fortyEightDp,
                width: twoHundredDp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tenDp),
                    color: CustomColors.teal),
                margin: EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: tenDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "\$",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sixteenDp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      width: thirtyDp,
                      height: thirtyDp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(twentyDp),
                          color: Colors.tealAccent.withOpacity(0.4)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: eightDp),
                      child: Text(
                        reviewThisTicket,
                        style:
                            TextStyle(color: Colors.white, fontSize: sixteenDp),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
