import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/widgets/bookings_item.dart';
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final Bookings bookings;

  const TicketWidget({Key? key, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.69),
          borderRadius: BorderRadius.circular(twentyDp)),
      margin: EdgeInsets.symmetric(vertical: sixteenDp, horizontal: sixteenDp),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      //contains bus details
                      BookingsItem(
                          bookings: bookings,
                          buttonName: "",
                          containerBgColor: Colors.transparent,
                          iconData: null,
                          iconDataColor: Colors.transparent,
                          textExtra:
                              "${bookings.bus.departureTime} - ${bookings.bus.departureDay}",
                          isTicket: true,
                          text: departs,
                          onTap: () {}),

                      //total passengers
                      Padding(
                        padding: const EdgeInsets.only(
                            left: sixteenDp, top: sixteenDp),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '$totalPassengers ',
                                style: TextStyle(
                                    color: CustomColors.grayMedium,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Mulish',
                                    fontSize: sixteenDp)),
                            WidgetSpan(
                              child: Text(
                                '${bookings.details.length}',
                                //superscript is usually smaller in size
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: fifteenDp),
                              ),
                            ),
                          ]),
                        ),
                      ),

                      //passenger details
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: sixteenDp, top: tenDp, bottom: tenDp),
                            child: Text(
                              passengerDetails,
                              style: TextStyle(
                                  color: CustomColors.teal,
                                  fontSize: sixteenDp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      //list of passenger name and seat number
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return getPassengerNameAndSeatNumber(index);
                        },
                        itemCount: bookings.details.length,
                        shrinkWrap: true,
                        primary: false,
                        physics: ClampingScrollPhysics(),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: sixteenDp, bottom: sixteenDp),
                        child: Image.asset(
                          'assets/images/line.png',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: tenDp, left: sixteenDp),
                        child: Text(
                          fareSummary,
                          style: TextStyle(
                              color: CustomColors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      fareItems('$ticketPrice x ${bookings.details.length}',
                          '${bookings.getTotalFair()}'),
                      fareItems('$tax ${bookings.details.length}', '${0}'),
                      fareItems('$totalFare', '${bookings.getTotalFair()}'),
                      SizedBox(height: twentyDp),
                    ],
                  ),
                ),

                //bottom widget
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sixteenDp, vertical: fourDp),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${bookings.details.length} $seats',
                              style: TextStyle(
                                  color: CustomColors.grayMedium,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: fourDp,
                              ),
                              child: Text(
                                //todo
                                '${bookings.details.map((seats) => seats.seatNo)}',
                                style: TextStyle(
                                    color: CustomColors.black,
                                    fontSize: sixteenDp,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              priceTicket,
                              style: TextStyle(
                                  color: CustomColors.grayMedium,
                                  fontSize: fourteenDp,
                                  fontWeight: FontWeight.w400),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: 'N',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                        fontFamily: 'Mulish',
                                        fontSize: seventeenDp)),
                                WidgetSpan(
                                  child: Text(
                                    '24,500',
                                    //superscript is usually smaller in size
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                        fontSize: fourteenDp),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: thirtyDp,
                          ),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$totalPrices: ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      // fontFamily: 'Mulish',
                                      fontSize: sixteenDp)),
                              WidgetSpan(
                                child: Text(
                                  'N73,500',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: sixteenDp),
                                ),
                              ),
                            ]),
                          ),
                        ),

                        //cancel tickets button
                        Container(
                          margin: EdgeInsets.symmetric(vertical: sixDp),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(tenDp)),
                            minWidth: oneTwentyDp,
                            height: fortyDp,
                            onPressed: () async {
                              //todo cancel payment
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Center(
                                    child: Text(
                                      "x",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: sixteenDp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  width: twentyFourDp,
                                  height: twentyFourDp,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(twentyDp),
                                      color: Colors.white.withOpacity(0.2)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: fourDp),
                                  child: Text(
                                    cancelTicketBooking,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: twelveDp),
                                  ),
                                ),
                              ],
                            ),
                            color: CustomColors.customRed,
                          ),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //seat numbers and passenger list
  getPassengerNameAndSeatNumber(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: eightDp),
      //padding: EdgeInsets.only(bottom: sixDp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '$name:',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mulish',
                      fontSize: fifteenDp)),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: fourDp,
                  ),
                  child: Text(
                    bookings.details[index].passengerName,
                    //superscript is usually smaller in size
                    style: TextStyle(
                        color: CustomColors.grayMedium,
                        fontWeight: FontWeight.bold,
                        fontSize: fourteenDp),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: fourDp,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '$seatNo',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Mulish',
                      fontSize: sixteenDp)),
              WidgetSpan(
                child: Text(
                  '${bookings.details[index].seatNo}',
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontWeight: FontWeight.bold,
                      fontSize: fifteenDp),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  //fair
  Widget fareItems(args1, args2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: fourDp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            args1,
            style: TextStyle(
                color: CustomColors.grayMedium, fontWeight: FontWeight.w500),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'N',
                  style: TextStyle(
                      color: CustomColors.black,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                      fontFamily: 'Mulish',
                      fontSize: sixteenDp)),
              WidgetSpan(
                child: Text(
                  args2,
                  //superscript is usually smaller in size
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: fifteenDp),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
