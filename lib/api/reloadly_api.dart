import 'dart:convert';

import 'package:bus_io/constansts/strings.dart';
import 'package:bus_io/model/gift_card.dart';
import 'package:bus_io/model/token.dart';
import 'package:http/http.dart' as http;

class ReloadLyApiService {
  static ReloadLyApiService? _instance;
  final clientId = reloadLyClientId;
  final secretId = reloadLySecretId;

  ReloadLyApiService._();

  static ReloadLyApiService get instance {
    return _instance == null ? _instance = ReloadLyApiService._() : _instance!;
  }

  //top ups
  //get token
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

  Future<String> fetchGiftCardToken() async {
    var options = {
      "client_id": clientId,
      "client_secret": secretId,
      "grant_type": "client_credentials",
      "audience": reloadLyGiftCardAudience
    };

    final getToken = await http.post(Uri.parse(reloadLyTokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(options));

    return getToken.body;
  }

  //gift cards
  Future<List<Content>> fetchGiftCards() async {
    var tokenOption = {
      "client_id": clientId,
      "client_secret": secretId,
      "grant_type": "client_credentials",
      "audience": reloadLyGiftCardAudience
    };

    //get token
    final token = await http.post(Uri.parse(reloadLyTokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(tokenOption));

    Token getToken = tokenFromJson(token.body);

    //get all products
    final response = await http.get(
      Uri.parse(reloadLyGiftCardProducts),
      headers: {
        'Authorization': 'Bearer ${getToken.accessToken}',
        'Accept': 'application/com.reloadly.giftcards-v1+json',
      },
    );

    final contents = GiftCard.fromJson(json.decode(response.body));

    print('contents ... ${contents.content}');
    return contents.content;
  }
}
