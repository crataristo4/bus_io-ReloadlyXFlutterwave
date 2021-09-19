import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/widgets/bookings_item.dart';
import 'package:flutter/material.dart';

class UpcomingBooking extends StatefulWidget {
  const UpcomingBooking({Key? key}) : super(key: key);

  @override
  _UpcomingBookingState createState() => _UpcomingBookingState();
}

class _UpcomingBookingState extends State<UpcomingBooking> {
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
            print('hi');
          },
          textExtra:
              "${bookings.bus.departureTime} - ${bookings.bus.departureDay}  ",
          buttonName: cancelThisTicket,
          text: "Departs",
        );
      },
      shrinkWrap: true,
      primary: true,
      itemCount: bookingList.length,
      physics: ClampingScrollPhysics(),
    ));
  }
}
