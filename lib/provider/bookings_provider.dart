import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/services/booking_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class BookingsProvider with ChangeNotifier {
  String? _to, _from, _bookingDate;
  dynamic _details;
  dynamic _bus;
  var randomId = Uuid();
  String? bookingId;
  BookingsService _bookingsService = BookingsService.instance;

  get to => _to;

  get from => _from;

  get bookingDate => _bookingDate;

  dynamic get details => _details;

  dynamic get bus => _bus;

  notifyDetails(to, from, bkDate, details, bus, context) {
    _to = to;
    _from = from;
    _bookingDate = bkDate;
    _details = details;
    _bus = bus;
    notifyListeners();
    createBookings(context);
  }

  createBookings(context) async {
    bookingId = randomId.v4();
    Bookings newBookings = Bookings(
        bookingId: bookingId!,
        userId: FirebaseAuth.instance.currentUser!.uid,
        from: from,
        to: to,
        bookingDate: bookingDate,
        details: details,
        bus: bus);

    await _bookingsService.createBookings(newBookings, context);
  }
}
