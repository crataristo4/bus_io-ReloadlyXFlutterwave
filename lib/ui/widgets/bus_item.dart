import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bus.dart';
import 'package:flutter/material.dart';

class BusItem extends StatefulWidget {
  final Bus bus;
  final Function()? onTap;
  final bool isBus;
  final bool isTicket;
  final int seatsBooked;

  BusItem(
      {Key? key,
      required this.bus,
      required this.isBus,
      required this.isTicket,
      required this.seatsBooked,
      required this.onTap})
      : super(key: key);

  @override
  _BusItemState createState() => _BusItemState();
}

class _BusItemState extends State<BusItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: widget.isTicket
              ? null
              : Border.all(color: Colors.grey.withOpacity(0.5), width: 0.69),
          borderRadius: BorderRadius.circular(twentyDp)),
      margin: EdgeInsets.symmetric(
          vertical: widget.isBus ? sixteenDp : 0,
          horizontal: widget.isBus ? 0 : sixteenDp),
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
                      widget.bus.busImage,
                      width: thirtyDp,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: sixDp, top: fourteenDp),
                    child: Text(
                      widget.bus.source.toString().toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: eightDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: fourDp, right: fourDp),
                      child: Text(
                        "${widget.bus.rating}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.grayMedium),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: fourDp, right: sixteenDp),
                      child: Text(
                        '(${widget.bus.numberOfRating})',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: CustomColors.grayMedium),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: twelveDp,
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
                  widget.bus.departureDay,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: twelveDp),
                child: Text(
                  widget.bus.busName,
                  style: TextStyle(
                      color: CustomColors.grayMedium,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          //departure time and seats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: sixteenDp),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '$departs ',
                        style: TextStyle(
                            color: CustomColors.grayMedium,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Mulish',
                            fontSize: sixteenDp)),
                    WidgetSpan(
                      child: Text(
                        widget.bus.departureTime,
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: sixteenDp, vertical: eightDp),
                child: Text(
                  "${widget.bus.numberOfSeats} Seats",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: sixteenDp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          //estimated time
          Padding(
            padding: const EdgeInsets.only(left: sixteenDp),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '$estimatedDuration ',
                    style: TextStyle(
                        color: CustomColors.grayMedium,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Mulish',
                        fontSize: sixteenDp)),
                WidgetSpan(
                  child: Text(
                    widget.bus.estimatedTime,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: fifteenDp),
                  ),
                ),
              ]),
            ),
          ),

          // SizedBox(height: fiftyDp,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: sixteenDp,
                        top: widget.isTicket ? fortyDp : twentyFourDp,
                        bottom: tenDp),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/free.png',
                          width: oneTwentyDp,
                        )
                      ],
                    ),
                  ),
                  widget.isTicket
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: sixteenDp),
                          child: Text(
                            '${widget.bus.remainingSeats.length} $seatsAvailable',
                            //superscript is usually smaller in size
                            style: TextStyle(
                                color: CustomColors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: fifteenDp),
                          ),
                        ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: thirtyDp,
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
                            '${widget.bus.price}',
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
                ),
              )
            ],
          ),
          widget.isBus
              ? SizedBox(
                  height: twentyDp,
                )
              : SizedBox(
                  height: tenDp,
                ),

          Image.asset('assets/images/line.png'),

          widget.isBus
              ? SizedBox(
                  height: twentyDp,
                )
              : SizedBox(
                  height: twelveDp,
                ),

          widget.isBus
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: sixteenDp, bottom: tenDp, top: thirtyDp),
                      child: Text(
                        viewTicketDetails,
                        style: TextStyle(
                            color: CustomColors.grayMedium,
                            fontSize: sixteenDp),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: sixteenDp, vertical: sixDp),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(eightDp)),
                        minWidth: oneTwentyDp,
                        height: fiftyDp,
                        onPressed: widget.onTap,
                        child: Text(
                          viewSeats,
                          style: TextStyle(
                              color: Colors.white, fontSize: sixteenDp),
                        ),
                        color: CustomColors.teal,
                      ),
                    )
                  ],
                )
              : widget.isTicket
                  ? Container()
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: twelveDp),
                        child: Text(
                          '$bookedSeat ${widget.seatsBooked}',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    )
        ],
      ),
    );
  }
}
