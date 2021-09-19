import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/widgets/bookings_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpcomingBooking extends StatefulWidget {
  const UpcomingBooking({Key? key}) : super(key: key);

  @override
  _UpcomingBookingState createState() => _UpcomingBookingState();
}

class _UpcomingBookingState extends State<UpcomingBooking> {
  final GlobalKey<State> _key = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        Bookings bookings = bookingList[index];
        return BookingsItem(
          bookings: bookings,
          containerBgColor: Colors.red,
          iconData: "X",
              iconDataColor: Colors.redAccent.withOpacity(0.9),
              onTap: () {
            ShowAction.showDetails(
                youAreAboutToCancelBookings,
                Colors.red,
                youAreAboutToCancelBookingsDes,
                Colors.grey,
                context,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(cancel),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pinkAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(tenDp),
                                      side: BorderSide(color: Colors.red))),
                        )),
                    SizedBox(
                      width: sixteenDp,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //todo .. remove bookings from list
                        },
                        child: Text(delete),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(tenDp),
                                      side: BorderSide(color: Colors.red))),
                        )),
                  ],
                ));
          },
          textExtra:
              "${bookings.bus.departureTime} - ${bookings.bus.departureDay}  ",
          buttonName: cancelThisTicket,
          text: "Departs",
          isTicket: false,
        );
          },
          shrinkWrap: true,
          primary: true,
          itemCount: bookingList.length,
          physics: ClampingScrollPhysics(),
        ));
  }
}
