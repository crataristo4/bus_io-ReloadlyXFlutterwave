import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/widgets/app_bar.dart';
import 'package:bus_io/ui/widgets/ticket_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketDetails extends StatefulWidget {
  final Bookings bookings;

  const TicketDetails({Key? key, required this.bookings}) : super(key: key);

  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.white,
      appBar: appBar(ticketDetails, () => Navigator.pop(context)),
      body: TicketWidget(
        bookings: widget.bookings,
      ),
    );
  }
}
