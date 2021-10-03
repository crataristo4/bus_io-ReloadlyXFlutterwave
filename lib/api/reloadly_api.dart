import 'dart:convert';

import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:bus_io/model/token.dart';
import 'package:http/http.dart' as http;

class ReloadLyApiService {
  static ReloadLyApiService? _instance;
  final clientId = reloadLyClientId;
  final secretId = reloadLySecretId;
  static String? _token;

  ReloadLyApiService._();

  static ReloadLyApiService get instance {
    return _instance == null ? _instance = ReloadLyApiService._() : _instance!;
  }

  //top ups
  Future<String> fetchTopUpToken() async {
    var options = {
      "client_id": clientId,
      "client_secret": secretId,
      "grant_type": "client_credentials",
      "audience": reloadLyTopUpAudience
    };

    final getToken = await http.post(Uri.parse(reloadLyTokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(options));

    return getToken.body;
  }


  //fetch gift cards
  Future<List<Content>> fetchGiftCards() async {
    var tokenOption = {
      "client_id": clientId,
      "client_secret": secretId,
      "grant_type": "client_credentials",
      "audience": reloadLyGiftCardAudience
    };

    //1.get token
    final token = await http.post(Uri.parse(reloadLyTokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(tokenOption));

    Token getToken = tokenFromJson(token.body);
    //...
    _token = getToken.accessToken;

    //2. use token to get all products
    final response = await http.get(
      Uri.parse(reloadLyGiftCardProducts),
      headers: {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/com.reloadly.giftcards-v1+json',
      },
    );

    final contents = GiftCard.fromJson(json.decode(response.body));

    return contents.content;
  }

  //fetch product/ gift card by id
  Future<List<Content>> fetchGiftCardById(int productId) async {
    String url = reloadLyGiftCardProducts + "/" + "$productId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/com.reloadly.giftcards-v1+json',
      },
    );

    final contents = GiftCard.fromJson(json.decode(response.body));

    return contents.content;
  }
}
