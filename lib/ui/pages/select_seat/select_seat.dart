import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/buses.dart';
import 'package:bus_io/ui/pages/add_passenger_details/add_passenger_details.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSeat extends StatefulWidget {
  static const routeName = '/selectSeat';
  final GetBus bus;
  final to, from, numberOfPassengers, date;

  const SelectSeat(
      {Key? key,
      required this.bus,
      required this.to,
      required this.from,
      required this.date,
      required this.numberOfPassengers})
      : super(key: key);

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;

  //generated seats
  var seatNumbers = new List<int>.generate(25, (i) => i + 1);
  List<int> selectedSeats = [];
  var totalPrice;

  @override
  void initState() {
    var set1 = Set.from(seatNumbers);
    var set2 = Set.from(widget.bus.remainingSeats);
    print(" ... ${List.from(set1.difference(set2))}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedSeats.isNotEmpty) {
      totalPrice = selectedSeats.length * widget.bus.price;
    } else {
      totalPrice = widget.bus.price;
    }

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
                    Card(
                      elevation: 0.5,
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(eightDp),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(eightDp),
                            border: Border.all(width: 0.5, color: Colors.grey)),
                        padding: EdgeInsets.all(twelveDp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildSeatStatus(
                                Colors.teal, selected, 0, Colors.teal),
                            buildSeatStatus(
                                Colors.white, available, 1.2, Colors.teal),
                            buildSeatStatus(Colors.grey.withOpacity(0.4),
                                booked, 0, Colors.grey),
                          ],
                        ),
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
                                        buildSeats(
                                            1,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(
                                            2,
                                            isSelected
                                                ? Colors.white
                                                : Colors.teal,
                                            isSelected
                                                ? Colors.teal
                                                : Colors.white,
                                            1.5,
                                            isSelected
                                                ? Colors.white
                                                : Colors.teal),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            8,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(
                                            7,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                                        buildSeats(
                                            16,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                        buildSeats(
                                            15,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                                        buildSeats(
                                            18,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                                        buildSeats(
                                            3,
                                            isSelected1
                                                ? Colors.white
                                                : Colors.teal,
                                            isSelected1
                                                ? Colors.teal
                                                : Colors.white,
                                            1.5,
                                            isSelected1
                                                ? Colors.white
                                                : Colors.teal),
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
                                        buildSeats(
                                            5,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildSeats(
                                            11,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                                        buildSeats(
                                            14,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                                        buildSeats(
                                            19,
                                            isSelected2
                                                ? Colors.white
                                                : Colors.teal,
                                            isSelected2
                                                ? Colors.teal
                                                : Colors.white,
                                            1.5,
                                            isSelected2
                                                ? Colors.white
                                                : Colors.teal),
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
                                        buildSeats(
                                            21,
                                            Colors.black,
                                            Colors.grey.withOpacity(0.5),
                                            0,
                                            Colors.white),
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
                              Padding(
                                padding: const EdgeInsets.only(left: sixteenDp),
                                child: Text(
                                  selectedSeats.length == 0
                                      ? "No seat selected"
                                      : selectedSeats.length < 1
                                      ? '${selectedSeats.length} $seat'
                                      : '${selectedSeats.length} $seats',
                                  style: TextStyle(
                                      color: CustomColors.grayMedium,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: fourDp, left: sixteenDp),
                                child: Text(
                                  selectedSeats.length == 0
                                      ? ""
                                      : "${selectedSeats.toString().replaceAll("[", "").replaceAll("]", "")}",
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  priceTicket,
                                  style: TextStyle(
                                      fontSize: fourteenDp,
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
                                            fontSize: sixteenDp)),
                                    WidgetSpan(
                                      child: Text(
                                        '${widget.bus.price}',
                                        //superscript is usually smaller in size
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
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
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: thirtyDp, left: sixteenDp),
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
                                  "$totalPrice",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: fifteenDp),
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
                            onPressed: () async {
                              if (selectedSeats.isEmpty ||
                                  selectedSeats.length < 2) {
                                ShowAction.showDetails(
                                    oops,
                                    Colors.black,
                                    oopsDes,
                                    Colors.red,
                                    context,
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: sixDp),
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
                                    ));
                              } else {
                                Dialogs.showLoadingDialog(
                                    context, loadingKey, "", Colors.white);
                                await Future.delayed(Duration(seconds: 3));
                                Navigator.pop(context);

                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddPassengerDetails(
                                    seatsSelected: selectedSeats,
                                    bus: widget.bus,
                                    totalPrice: totalPrice,
                                    to: widget.to,
                                    from: widget.from,
                                      date: widget.date),
                                ));
                              }
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
  Widget buildSeatStatus(Color bgColor, String title, double borderWidth, Color borderColor) {
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
    return GestureDetector(
      onTap: () {
        if (bgColor == Colors.teal || bgColor == Colors.grey.withOpacity(0.5)) {
          SnackBar snackBar = SnackBar(
            content: Text(
              alreadySelected,
              style: TextStyle(color: Colors.white),
            ),
            duration: Duration(milliseconds: 800),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (seatNumber == 2) {
          selectedSeats.add(seatNumber);
          setState(() {
            isSelected = true;
          });
        } else if (seatNumber == 3) {
          selectedSeats.add(seatNumber);
          setState(() {
            isSelected1 = true;
          });
        } else if (seatNumber == 19) {
          selectedSeats.add(seatNumber);
          setState(() {
            isSelected2 = true;
          });
        }
      },
      child: Container(
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
      ),
    );
  }
}
