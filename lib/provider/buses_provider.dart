import 'package:bus_io/model/buses.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/services/app_api_service.dart';
import 'package:flutter/cupertino.dart';

class BusesProvider with ChangeNotifier {
  AppApiService _apiService = AppApiService.instance;
  ApiState _apiState = ApiState.Initial;
  List<GetBus> busList = [];

  BusesProvider() {
    //fetchBusList();
  }

  //getter
  ApiState get apiState => _apiState;

  //get buses
  Future<List<GetBus>> fetchBusList() async {
    _apiState = ApiState.Loading;

    try {
      _apiState = ApiState.Loaded;
      busList = await _apiService.getBuses().then((value) {
        return value;
      });

      notifyListeners();
    } catch (e) {
      _apiState = ApiState.Error;
    }

    notifyListeners();
    return busList;
  }
}
