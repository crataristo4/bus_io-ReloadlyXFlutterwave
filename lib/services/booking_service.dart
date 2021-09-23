import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/bookings.dart';
import 'package:bus_io/ui/pages/main_page/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingsService {
  final firestoreService = FirebaseFirestore.instance;
  static BookingsService? _instance;
  static String? uid;

  BookingsService._();

  static BookingsService get instance {
    if (FirebaseAuth.instance.currentUser != null) {
      uid = FirebaseAuth.instance.currentUser!.uid;
    }
    return _instance == null ? _instance = BookingsService._() : _instance!;
  }

  createBookings(Bookings newBookings, BuildContext context) async {
    return await firestoreService
        .collection(bookings)
        .add(newBookings.toJson())
        .whenComplete(() {
      //navigate to bookings
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MainPage(
              selectedIndex: 1,
            ),
          ),
          (route) => false);
    });
  }

  Stream<List<Bookings>> getBookings() {
    return firestoreService
        .collection(bookings)
        .orderBy('bookingDate', descending: true)
        .where('userId', isEqualTo: uid)
        .snapshots()
        .map((snapshots) => snapshots.docs.map((document) {
              print("${document.data()}");
              return Bookings.fromJson(document.data());
            }).toList(growable: true))
        .handleError((error) {
      print("error --- $error");
    });
  }
}
