import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/constansts/theme_color.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/widgets/bookings_item.dart';
import 'package:bus_io/ui/widgets/custom_cancel_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingBooking extends StatefulWidget {
  const UpcomingBooking({Key? key}) : super(key: key);

  @override
  _UpcomingBookingState createState() => _UpcomingBookingState();
}

class _UpcomingBookingState extends State<UpcomingBooking> {
  final GlobalKey<State> _key = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    final bookings = Provider.of<List<Bookings>>(context);

    print(" ??? ${bookings.length}");
    return Container();
    /*return Container(
        child: ListView.builder(
      itemBuilder: (context, index) {
        Bookings bookings = bookingList[index];
        return BookingsItem(
          bookings: bookings,
          containerBgColor: CustomColors.customRed,
          iconData: "x",
          iconDataColor: Colors.white.withOpacity(0.3),
          onTap: () {
            ShowAction.showDetails(
                youAreAboutToCancelBookings,
                Colors.red,
                youAreAboutToCancelBookingsDes,
                Colors.grey,
                context,
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CancelButton(),
                        SizedBox(
                          width: sixteenDp,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //todo .. remove bookings from list
                            },
                            child: Text(delete),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColors.customRed),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(tenDp),
                                      side: BorderSide(color: Colors.red))),
                            )),
                      ],
                    ),
                  ],
                ));
          },
          textExtra:
              "${bookings.bus.departureTime} - ${bookings.bus.departureDay}",
          buttonName: cancelTicketBooking,
          text: departs,
          isTicket: false,
        );
      },
      shrinkWrap: true,
      primary: true,
      itemCount: bookingList.length,
      physics: ClampingScrollPhysics(),
    ));*/
  }
}
