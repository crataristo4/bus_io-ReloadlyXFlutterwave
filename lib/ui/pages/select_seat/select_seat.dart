import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bus.dart';
import 'package:bus_io/ui/pages/add_passenger_details/add_passenger_details.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  static const routeName = '/selectSeat';
  final Bus bus;

  const SelectSeat({Key? key, required this.bus}) : super(key: key);

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  bool isBooked = false;
  bool isAvailable = true;
  bool isSelected = false;
  int seatsSelected = 3;
  int ticketFair = 3;
  int totalPrice = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(selectSeat, () {
        Navigator.pop(context);
      }),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(twelveDp),
                      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.4),
                          borderRadius: BorderRadius.circular(eightDp)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildSeatStatus(
                              Colors.teal, selected, 0, Colors.teal),
                          buildSeatStatus(
                              Colors.white, available, 1.2, Colors.teal),
                          buildSeatStatus(Colors.grey.withOpacity(0.4), booked,
                              0, Colors.grey),
                        ],
                      ),
                    ),
                    //second row
                    Container(
                      margin: EdgeInsets.only(
                          left: sixteenDp,
                          right: sixteenDp,
                          top: thirtyDp,
                          bottom: thirtyDp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/icons/health.png'),
                          Image.asset('assets/icons/door.png'),
                        ],
                      ),
                    ),

                    //third row for seats
                    Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                //seat 1
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        buildSeats(1, Colors.white, Colors.teal,
                                            0, Colors.teal),
                                        buildSeats(2, Colors.teal, Colors.white,
                                            1.5, Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(8, Colors.white, Colors.teal,
                                            0, Colors.teal),
                                        buildSeats(7, Colors.teal, Colors.white,
                                            1.5, Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            9,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(
                                            10,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(16, Colors.white,
                                            Colors.teal, 0, Colors.teal),
                                        buildSeats(15, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            17,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(18, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            24,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(
                                            25,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                  ],
                                ),

                                //seat 2
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        buildSeats(3, Colors.teal, Colors.white,
                                            1.5, Colors.teal),
                                        buildSeats(
                                            4,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            6,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(5, Colors.teal, Colors.white,
                                            1.5, Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(11, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                        buildSeats(
                                            12,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(14, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                        buildSeats(
                                            13,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(19, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                        buildSeats(
                                            20,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            22,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(21, Colors.teal,
                                            Colors.white, 1.5, Colors.teal),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            //last seat
                          ],
                        ),
                        PositionedDirectional(
                            top: threeHundredDp,
                            start: 162,
                            end: 162,
                            child: buildSeats(23, Colors.black,
                                Colors.grey.withOpacity(0.5), 0, Colors.white)),
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sixteenDp, vertical: sixteenDp),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: tenDp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //todo get seat number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$seatsSelected $seats',
                                style: TextStyle(
                                    color: CustomColors.grayMedium,
                                    fontWeight: FontWeight.w400),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: fourDp),
                                child: Text(
                                  '1,8,16',
                                  style: TextStyle(
                                      color: CustomColors.black,
                                      fontSize: sixteenDp,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: sixteenDp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  priceTicket,
                                  style: TextStyle(
                                      color: CustomColors.grayMedium,
                                      fontWeight: FontWeight.w400),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'N',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            // fontFamily: 'Mulish',
                                            fontSize: eighteenDp)),
                                    WidgetSpan(
                                      child: Text(
                                        '24,500',
                                        //superscript is usually smaller in size
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            fontSize: eighteenDp),
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: thirtyDp),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '$totalPrices: ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      // fontFamily: 'Mulish',
                                      fontSize: eighteenDp)),
                              WidgetSpan(
                                child: Text(
                                  'N73,500',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: eighteenDp),
                                ),
                              ),
                            ]),
                          ),
                        ),

                        //continue button
                        Container(
                          margin: EdgeInsets.symmetric(vertical: sixDp),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(tenDp)),
                            minWidth: oneTwentyDp,
                            height: fiftyDp,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddPassengerDetails(
                                  seatsSelected: 2,
                                  bus: widget.bus,
                                  passengerList: [
                                    // todo -- get from controllers
                                    'Tobiloba Adekunle',
                                    'Mildred Egenti',
                                    'Mildred Egenti'
                                  ],
                                  seatNumberSelectedList: [1, 8, 16],
                                ),
                              ));
                              /*ShowAction.showDetails(
                                  oops,
                                  oopsDes,
                                  context,
                                  Center(
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: sixDp),
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(tenDp)),
                                        minWidth: ninetyDp,
                                        height: thirtyEightDp,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          ok,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: sixteenDp),
                                        ),
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ));*/
                            },
                            child: Text(
                              conTiNue,
                              style: TextStyle(
                                  color: Colors.white, fontSize: sixteenDp),
                            ),
                            color: CustomColors.teal,
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

  //seat status with color codes
  Widget buildSeatStatus(
      Color bgColor, String title, double borderWidth, Color borderColor) {
    return Row(
      children: [
        Container(
          width: twentyDp,
          height: twentyDp,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(eightDp),
              border: Border.all(width: borderWidth, color: borderColor)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: sixteenDp),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  //seat numbering
  Widget buildSeats(int seatNumber, Color textColor, Color bgColor,
      double borderWidth, Color borderColor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp, vertical: tenDp),
      width: fortyDp,
      height: fortyDp,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(eightDp),
          border: Border.all(width: borderWidth, color: borderColor)),
      child: Center(
        child: Text(
          '$seatNumber',
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
