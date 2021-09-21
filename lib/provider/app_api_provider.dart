import 'package:bus_io/model/buses.dart';
import 'package:bus_io/model/cities.dart';
import 'package:bus_io/services/app_api_service.dart';
import 'package:flutter/cupertino.dart';

class AppApiProvider with ChangeNotifier {
  AppApiService _apiService = AppApiService.instance;
  ApiState _apiState = ApiState.Initial;
  List<GetBus> busList = [];
  List<GetCity> cityList = [];
  String? _cityName;
  bool _isFrom = false;

  get cityName => _cityName;

  get isFrom => _isFrom;

  //getter
  ApiState get apiState => _apiState;

  AppApiProvider() {
    //
    // fetchCityList();
  }

  //get buses
  Future<List<GetBus>> fetchBusList() async {
    _apiState = ApiState.Loading;

    try {
      busList = await _apiService.getBuses();
      _apiState = ApiState.Loaded;
    } catch (e) {
      _apiState = ApiState.Error;
    }

    notifyListeners();
    return busList;
  }

  //get cities
  Future<List<GetCity>> fetchCityList() async {
    _apiState = ApiState.Loading;

    try {
      cityList = await AppApiService.instance.getCity();
      _apiState = ApiState.Loaded;
    } catch (e) {
      _apiState = ApiState.Error;
    }

    notifyListeners();
    return cityList;
  }

  saveCity(String cityName, bool from) {
    _cityName = cityName;
    _isFrom = from;

    notifyListeners();
    updateCity();
  }

  updateCity() {
    AppApiService.instance.updateCity(cityName, isFrom);
  }
}

//states
enum ApiState { Initial, Loading, Loaded, Error }
