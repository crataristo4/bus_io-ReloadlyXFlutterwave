import 'package:bus_io/model/buses.dart';
import 'package:bus_io/model/cities.dart';
import 'package:bus_io/services/app_api_service.dart';
import 'package:flutter/cupertino.dart';

class AppApiProvider with ChangeNotifier {
  AppApiService _apiService = AppApiService.instance;
  ApiState _apiState = ApiState.Initial;
  List<GetBus> busList = [];
  List<GetCity> cityList = [];

  AppApiProvider() {
    //
    fetchBusList();
  }

  //get buses
//fetch users
  Future<List<GetBus>> fetchBusList() async {
    _apiState = ApiState.Loading;

    try {
      busList = await _apiService.getBuses().then((value) {
        _apiState = ApiState.Loaded;

        return value;
      });
    } catch (e) {
      _apiState = ApiState.Error;
    }

    notifyListeners();
    return busList;
  }
}

//states
enum ApiState { Initial, Loading, Loaded, Error }
