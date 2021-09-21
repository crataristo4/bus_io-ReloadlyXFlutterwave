import 'dart:convert';

import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/buses.dart';
import 'package:bus_io/model/cities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AppApiService {
  static AppApiService? _instance;
  final baseUrl = busIoBaseUrl;
  final firestoreService = FirebaseFirestore.instance;
  static String? uid;

  //private constructor
  AppApiService._();

  //singleton
  static AppApiService get instance {
    if (FirebaseAuth.instance.currentUser != null) {
      uid = FirebaseAuth.instance.currentUser!.uid;
    }
    return _instance == null ? _instance = AppApiService._() : _instance!;
  }

  //method to get buses
  Future<List<GetBus>> getBuses() async {
    final getBus = await http.get(Uri.parse('$baseUrl$buses'), headers: {
      'Content-type': 'application/json',
      "accept": 'application/json'
    });

    final listOfBus = Buses.fromJson(jsonDecode(getBus.body));

    return listOfBus.getBuses!;
  }

  //method to get all cities
  Future<List<GetCity>> getCity() async {
    final getCity = await http.get(Uri.parse('$baseUrl$cities'), headers: {
      'Content-type': 'application/json',
      "accept": 'application/json'
    });

    final listOfCites = Cities.fromJson(jsonDecode(getCity.body));

    return listOfCites.getCities!;
  }

  //search city by name
  Future<List<GetCity>> searchCity(String cityName) async {
    final getCity = await http.get(Uri.parse('$baseUrl$cities$cityName'),
        headers: {
          'Content-type': 'application/json',
          "accept": 'application/json'
        });

    final listOfCites = Cities.fromJson(jsonDecode(getCity.body));

    return listOfCites.getCities!;
  }

  //update city name
  Future<void> updateCity(String cityName, bool from) async {
    return await firestoreService
        .collection('Users')
        .doc(uid)
        .update({from ? "to" : "from": cityName});
  }
}
