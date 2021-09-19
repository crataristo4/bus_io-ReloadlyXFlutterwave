import 'package:bus_io/constansts/dimens.dart';
import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/ui/pages/bookings/upcoming_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'booking_history.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.animateTo(1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        elevation: 0,
        title: Text(
          bookings,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: fortyEightDp,
            margin: EdgeInsets.symmetric(horizontal: sixteenDp),
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              border: Border.all(width: 1, color: Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(eightDp),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(tenDp),
                color: Colors.white,
              ),
              labelColor: Colors.teal,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: upcoming,
                ),
                Tab(
                  text: history,
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
            children: [UpcomingBooking(), BookingHistory()],
            controller: _tabController,
          ))
        ],
      ),
    );
  }
}
