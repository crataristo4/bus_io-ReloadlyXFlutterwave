import 'package:bus_io/model/cities.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/services/cities_service.dart';
import 'package:flutter/cupertino.dart';

class CityProvider with ChangeNotifier {
  ApiState _apiState = ApiState.Initial;
  CitiesService _citiesService = CitiesService.instance;
  List<GetCity> cityList = [];
  String? _cityName;
  bool _isFrom = false;

  get cityName => _cityName;

  get isFrom => _isFrom;

  //getter
  ApiState get apiState => _apiState;

  CityProvider() {
    // fetchCityList();
  }

  //get cities
  Future<List<GetCity>> fetchCityList() async {
    _apiState = ApiState.Loading;

    try {
      _apiState = ApiState.Loaded;
      cityList = await _citiesService.getCity().then((value) {
        return value;
      });
      notifyListeners();
    } catch (e) {
      _apiState = ApiState.Error;
      print(e.toString());
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
    CitiesService.instance.updateCity(cityName, isFrom);
  }
}
