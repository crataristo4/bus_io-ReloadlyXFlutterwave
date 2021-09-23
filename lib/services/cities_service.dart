import 'dart:convert';

import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/cities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class CitiesService {
  static CitiesService? _instance;
  final baseUrl = busIoBaseUrl;
  final firestoreService = FirebaseFirestore.instance;
  static String? uid;

  //private constructor
  CitiesService._();

  //singleton
  static CitiesService get instance {
    if (FirebaseAuth.instance.currentUser != null) {
      uid = FirebaseAuth.instance.currentUser!.uid;
    }
    return _instance == null ? _instance = CitiesService._() : _instance!;
  }

//method to get all cities
  Future<List<GetCity>> getCity() async {
    final getCity = await http.get(Uri.parse('$baseUrl$cities'), headers: {
      'Content-type': 'application/json',
      "accept": 'application/json'
    });

    final listOfCites = Cities.fromJson(jsonDecode(getCity.body));

    return listOfCites.data.getCities!;
  }

  //search city by name
  Future<List<GetCity>> searchCity(String cityName) async {
    final getCity = await http.get(Uri.parse('$baseUrl$cities$cityName'),
        headers: {
          'Content-type': 'application/json',
          "accept": 'application/json'
        });

    final listOfCites = Cities.fromJson(jsonDecode(getCity.body));

    return listOfCites.data.getCities!;
  }

  //update city name
  Future<void> updateCity(String cityName, bool from) async {
    return await firestoreService
        .collection('Users')
        .doc(uid)
        .update({from ? "to" : "from": cityName});
  }
}
