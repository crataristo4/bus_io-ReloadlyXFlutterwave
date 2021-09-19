import 'package:bus_io/actions/actions.dart';
import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/ui/pages/home_page/home_page.dart';
import 'package:bus_io/ui/widgets/button_controller.dart';
import 'package:bus_io/ui/widgets/option_selector_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  String? today;

  @override
  void initState() {
    today = dateFormat.format(dateTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(sixteenDp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final selectedDate =
                      await ShowAction().selectDate(context);
                      if (selectedDate == null) return;
                      dateTime = DateTime(
                        selectedDate.day,
                        selectedDate.month,
                        selectedDate.year,
                      );
                      setState(() {
                        today = dateFormat.format(dateTime);
                      });

                      print('?? $today');
                    },
                    child: OptionSelector(
                      title: from,
                      icon: 'assets/icons/calender.png',
                      widget: Text('$today'),
                      textColor: Colors.black45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final selectedDate =
                      await ShowAction().selectDate(context);
                      if (selectedDate == null) return;
                      dateTime = DateTime(
                        selectedDate.day,
                        selectedDate.month,
                        selectedDate.year,
                      );
                      setState(() {
                        today = dateFormat.format(dateTime);
                      });

                      print('?? $today');
                    },
                    child: OptionSelector(
                      title: to,
                      icon: 'assets/icons/calender.png',
                      widget: Text('08/10/2021'),
                      textColor: Colors.black45, //todo change date
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: sixteenDp),
              child: ButtonWidget(buttonName: search, onButtonTapped: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(top: thirtyDp, bottom: sixteenDp),
              child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/nobooking.svg',
                        placeholderBuilder: (BuildContext context) =>
                            Container(),
                      ),
                      SizedBox(height: twentyDp,),
                      Text(
                        noPreviousBooking,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: twentyDp),
                      ),
                      SizedBox(height: tenDp,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: thirtyDp),
                        child: Text(
                          whenBusesAreBooked,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black45, fontSize: sixteenDp),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
