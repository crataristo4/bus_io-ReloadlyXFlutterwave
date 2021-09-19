import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:flutter/material.dart';

class BookingsItem extends StatefulWidget {
  final Bookings bookings;
  final Color containerBgColor;
  final iconData;
  final Color iconDataColor;
  final buttonName;
  final text;
  final textExtra;
  final Function()? onTap;

  const BookingsItem(
      {Key? key,
      required this.bookings,
      required this.buttonName,
      required this.containerBgColor,
      required this.iconData,
      required this.iconDataColor,
      required this.textExtra,
      required this.text,
      required this.onTap})
      : super(key: key);

  @override
  _BookingsItemState createState() => _BookingsItemState();
}

class _BookingsItemState extends State<BookingsItem> {
  @override
  Widget build(BuildContext context) {
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
                    padding:
                        const EdgeInsets.only(left: fourDp, top: fourteenDp),
                    child: Image.asset(
                      widget.bookings.bus.busImage,
                      width: thirtyDp,
                      height: twentyDp,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: sixDp, top: fourteenDp),
                    child: Text(
                      widget.bookings.bus.source.toString().toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, right: sixteenDp),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '${widget.text} ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.grayMedium,
                            // fontFamily: 'Mulish',
                            fontSize: 11)),
                    WidgetSpan(
                      child: Text(
                        '${widget.textExtra}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                    ),
                  ]),
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
                  widget.bookings.bus.busName,
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
                child: Text('${widget.bookings.from} ',
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
                  "${widget.bookings.bus.numberOfSeats} Seats",
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
              widget.bookings.to,
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
                          '${widget.bookings.bus.price}',
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
                        "${widget.bookings.details.length} $seats",
                        style: TextStyle(
                            color: CustomColors.grayMedium,
                            fontSize: fourteenDp),
                      ),
                    ),
                    Text(
                      "${widget.bookings.details.map((e) => e.seatNo)}",
                      style: TextStyle(
                          color: CustomColors.black,
                          fontSize: sixteenDp,
                          fontWeight: FontWeight.bold),
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
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: tenDp,
          ),
          Center(
            child: GestureDetector(
              onTap: widget.onTap
              //proceed to review bookings
              ,
              child: Container(
                height: fortyEightDp,
                width: twoHundredDp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(tenDp),
                    color: widget.containerBgColor),
                margin: EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: tenDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          widget.iconData,
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
                          color: widget.iconDataColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: eightDp),
                      child: Text(
                        widget.buttonName,
                        style: TextStyle(
                            color: Colors.white, fontSize: fourteenDp),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: eightDp,
          ),
        ],
      ),
    );
  }
}
