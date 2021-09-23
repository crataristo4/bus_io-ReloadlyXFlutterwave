import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/services/booking_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class BookingsProvider with ChangeNotifier {
  String? _to, _from, _bookingDate;
  String? _source;
  String? _busName;
  String? _busImage;
  int? _ticketPrice;
  int? _totalPrice;
  String? _departureTime;
  String? _departureDay;
  dynamic _details;
  var randomId = Uuid();
  String? bookingId;
  BookingsService _bookingsService = BookingsService.instance;

  get to => _to;

  get from => _from;

  get bookingDate => _bookingDate;

  dynamic get details => _details;

  get source => _source;

  notifyDetails(to, from, bkDate, details, context, source, dpTime, dpDay,
      busName, busImage, ticketPrice, totalPrice) {
    _to = to;
    _from = from;
    _bookingDate = bkDate;
    _details = details;
    _source = source;
    _busName = busName;
    _busImage = busImage;
    _ticketPrice = ticketPrice;
    _totalPrice = totalPrice;
    _departureTime = dpTime;
    _departureDay = dpTime;
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
      ticketPrice: ticketPrice,
      totalPrice: totalPrice,
      departureTime: departureTime,
      source: source,
      departureDay: departureDay,
      busImage: busImage,
      busName: busName,
    );

    await _bookingsService.createBookings(newBookings, context);
  }

  get busName => _busName;

  get busImage => _busImage;

  get ticketPrice => _ticketPrice;

  get totalPrice => _totalPrice;

  get departureTime => _departureTime;

  get departureDay => _departureDay;
}
