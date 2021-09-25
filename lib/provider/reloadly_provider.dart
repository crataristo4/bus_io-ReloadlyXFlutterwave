import 'package:bus_io/api/reloadly_api.dart';
import 'package:bus_io/model/enum_states.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:flutter/foundation.dart';

class ReloadLyProvider with ChangeNotifier {
  ApiState _apiState = ApiState.Initial;
  ReloadLyApiService _reloadLyApiService = ReloadLyApiService.instance;
  List<Content> contentList = [];

  //getter
  ApiState get apiState => _apiState;

  ReloadLyProvider() {
    fetchCards();
  }

  //fetch gift cards
  Future<List<Content>> fetchCards() async {
    _apiState = ApiState.Loading;
    try {
      _apiState = ApiState.Loaded;
      contentList = await _reloadLyApiService.fetchGiftCards().then((value) {
        return value;
      });
    } catch (e) {
      _apiState = ApiState.Error;
    }

    notifyListeners();
    return contentList;
  }
}
