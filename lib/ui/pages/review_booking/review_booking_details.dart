import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bus.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/bus_item.dart';
import 'package:bus_io/ui/widgets/modify_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewBookingDetails extends StatefulWidget {
  static const routeName = '/reviewBookingDetails';
  final Bus bus;
  final List<String> passengerList;
  final List<int> seatNumberSelectedList;

  const ReviewBookingDetails(
      {Key? key,
      required this.bus,
      required this.passengerList,
      required this.seatNumberSelectedList})
      : super(key: key);

  @override
  _ReviewBookingDetailsState createState() => _ReviewBookingDetailsState();
}

class _ReviewBookingDetailsState extends State<ReviewBookingDetails> {
  int? index;
  int? totalPrice;

  @override
  void initState() {
    totalPrice = widget.bus.price * widget.passengerList.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(reviewBookingDetails, () {
        Navigator.pop(context);
      }),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //todo - check overflow
                ListView(
                  shrinkWrap: true,
                  primary: true,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //contains bus details
                    BusItem(
                      bus: widget.bus,
                      isBus: false,
                      onTap: () {},
                      seatsBooked: widget.seatNumberSelectedList.length,
                    ),

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
                              '${widget.passengerList.length}',
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
                              left: sixteenDp, top: sixteenDp),
                          child: Text(
                            passengerDetails,
                            style: TextStyle(
                                color: CustomColors.teal,
                                fontSize: sixteenDp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: fiftyDp,
                          width: oneThirtyDp,
                          margin: EdgeInsets.symmetric(horizontal: tenDp),
                          child: ModifyOrFilter(
                              title: editDetails,
                              icon: '$iconAssetPrefix$editIcon',
                              onTap: () => Navigator.of(context).pop()),
                        )
                      ],
                    ),

                    //list of passenger name and seat number
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return getNameAndSeatNumber(index);
                      },
                      itemCount: widget.passengerList.length,
                      shrinkWrap: true,
                      primary: true,
                      physics: ClampingScrollPhysics(),
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

                    fareItems('$ticketPrice x ${widget.passengerList.length}',
                        '$totalPrice'),
                    fareItems('$tax ${widget.passengerList.length}', '${0}'),
                    fareItems('$totalFare', '$totalPrice'),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: sixteenDp, vertical: fourDp),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //todo get seat number
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: tenDp),
                              child: Text(
                                '${widget.seatNumberSelectedList.length} $seats',
                                style: TextStyle(
                                    color: CustomColors.grayMedium,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: fourDp, left: tenDp),
                              child: Text(
                                //todo
                                '${widget.seatNumberSelectedList.toString()}',
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: sixteenDp),
                          child: Column(
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
                                          decoration:
                                              TextDecoration.lineThrough,
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
                        ),
                      ],
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

                        //pay tickets button
                        Container(
                          margin: EdgeInsets.symmetric(vertical: sixDp),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(tenDp)),
                            minWidth: oneTwentyDp,
                            height: fiftyTwoDp,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: eightDp),
                                  child: Text(
                                    payForTickets,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fourteenDp),
                                  ),
                                ),
                                Image.asset(
                                  '$iconAssetPrefix$ticketImg',
                                  width: twentyDp,
                                )
                              ],
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

  //seat numbers and passenger list
  getNameAndSeatNumber(index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: sixteenDp),
      padding: EdgeInsets.only(bottom: sixDp),
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
                    widget.passengerList[index!],
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
                  '${widget.seatNumberSelectedList[index!]}',
                  //superscript is usually smaller in size
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
