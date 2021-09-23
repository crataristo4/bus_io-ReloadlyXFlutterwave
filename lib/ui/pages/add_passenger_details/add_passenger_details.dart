import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/actions/progress_dialog.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/model/buses.dart';
import 'package:bus_io/ui/pages/config_page/configuration_page.dart';
import 'package:bus_io/ui/pages/review_booking/review_booking_details.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/passenger_details.dart';
import 'package:flutter/material.dart';

class AddPassengerDetails extends StatefulWidget {
  static const routeName = '/addPassengerDetails';
  final seatsSelected;
  final GetBus bus;
  final totalPrice;
  final to, from, date;

  //final List<int> seatNumberSelectedList;

//  final double ticketPrice;

  const AddPassengerDetails({
    Key? key,
    //required this.ticketPrice
    required this.seatsSelected,
    required this.bus,
    required this.totalPrice,
    required this.to,
    required this.from,
    required this.date,
    //  required this.seatNumberSelectedList,
  }) : super(key: key);

  @override
  _AddPassengerDetailsState createState() => _AddPassengerDetailsState();
}

class _AddPassengerDetailsState extends State<AddPassengerDetails> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController ageController1 = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();

  //passenger 2
  TextEditingController nameController2 = TextEditingController();
  TextEditingController ageController2 = TextEditingController();
  TextEditingController phoneController2 = TextEditingController();

  List<String> _seatSelected = ['Seat 2', 'Seat 3'];
  List<Details> passengerDetails = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(addPassengerDetails, () {
        Navigator.pop(context);
      }),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: twentyDp,
                        ),
                        pl(_seatSelected.length),
                      ],
                    ),
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
                                  padding:
                                      const EdgeInsets.only(left: sixteenDp),
                                  child: Text(
                                    '${widget.seatsSelected.length} $seats',
                                    style: TextStyle(
                                        color: CustomColors.grayMedium,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: sixteenDp, top: fourDp),
                                  child: Text(
                                    '${widget.seatsSelected.toString().replaceAll('[', '').replaceAll(']', '')}',
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
                                    '${widget.totalPrice}',
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
                                //validate inputs
                                if (_formKey.currentState!.validate()) {
                                  //passenger details
                                  passengerDetails.add(Details(
                                      passengerName: nameController1.text,
                                      seatNo: "Seat 2"));
                                  passengerDetails.add(Details(
                                      passengerName: nameController2.text,
                                      seatNo: "Seat 3"));

                                  Dialogs.showLoadingDialog(
                                      context, loadingKey, "", Colors.white);
                                  await Future.delayed(Duration(seconds: 3));
                                  Navigator.pop(context);

                                  //goto review page
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ReviewBookingDetails(
                                        bus: widget.bus,
                                        seatNumberSelectedList:
                                            widget.seatsSelected,
                                        totalPrice: widget.totalPrice,
                                        passengerList: passengerDetails,
                                        to: widget.to,
                                        from: widget.from,
                                        date: widget.date),
                                  ));
                                } else {
                                  //show error
                                  ShowAction.showDetails(
                                      oops,
                                      Colors.black,
                                      pleaseSelectAllSeats,
                                      Colors.red,
                                      context,
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: sixDp),
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        tenDp)),
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
                                }
                              },
                              child: Text(
                                reviewBookingDetails,
                                style: TextStyle(
                                    color: Colors.white, fontSize: fourteenDp),
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
            ),
          )
        ],
      ),
    );
  }

  //todo not dynamic
  //list of passenger details
  pl(int seatSelected) {
    switch (seatSelected) {
      case 1:
        PassengerDetails(
            title: '$passenger $seatSelected}',
            nameController: nameController1,
            ageController: ageController1,
            phoneController: phoneController1,
            onTap: () {
              //todo
            },
            dropDownList: _seatSelected);
        break;
      case 2:
        return Column(
          children: [
            PassengerDetails(
                title: '$passenger ${seatSelected - 1}',
                nameController: nameController1,
                ageController: ageController1,
                phoneController: phoneController1,
                onTap: () {
                  //todo
                },
                dropDownList: _seatSelected),
            PassengerDetails(
                title: '$passenger $seatSelected',
                nameController: nameController2,
                ageController: ageController2,
                phoneController: phoneController2,
                onTap: () {
                  //todo
                },
                dropDownList: _seatSelected)
          ],
        );
    /* case 3:
        return Column(
          children: [
            PassengerDetails(
                title: '$passenger ${seatSelected - 2}',
                nameController: nameController1,
                ageController: ageController1,
                phoneController: phoneController1,
                onTap: () {
                  //todo
                },
                dropDownList: _seatSelected),
            PassengerDetails(
                title: '$passenger ${seatSelected - 1}',
                nameController: nameController2,
                ageController: ageController2,
                phoneController: phoneController2,
                onTap: () {
                  //todo
                },
                dropDownList: _seatSelected),
            PassengerDetails(
                title: '$passenger $seatSelected',
                nameController: nameController3,
                ageController: ageController3,
                phoneController: phoneController3,
                onTap: () {
                  //todo
                },
                dropDownList: _seatSelected)
          ],
        );
*/
      default:
        PassengerDetails(
            title: '$passenger $seatSelected',
            nameController: nameController1,
            ageController: ageController1,
            phoneController: phoneController1,
            onTap: () {
              //todo
            },
            dropDownList: _seatSelected);
    }
  }
}
