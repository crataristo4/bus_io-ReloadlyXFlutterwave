import 'dart:convert';

import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/buses.dart';
import 'package:http/http.dart' as http;

class BusesService {
  static BusesService? _instance;
  final baseUrl = busIoBaseUrl;

  //private constructor
  BusesService._();

  //singleton
  static BusesService get instance {
    return _instance == null ? _instance = BusesService._() : _instance!;
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
}
