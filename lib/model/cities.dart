//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  Cities({
    required this.status,
    required this.results,
    required this.data,
  });

  final String status;
  final int results;
  final Data data;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        status: json["status"],
        results: json["results"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.getCities,
  });

  final List<GetCity>? getCities;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getCities: List<GetCity>.from(
            json["getCities"].map((x) => GetCity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getCities": List<dynamic>.from(getCities!.map((x) => x.toJson())),
      };
}

class GetCity {
  GetCity({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.v,
  });

  final String id;
  final String cityName;
  final CountryName countryName;
  final int v;

  factory GetCity.fromJson(Map<String, dynamic> json) => GetCity(
        id: json["_id"],
        cityName: json["cityName"],
        countryName: countryNameValues.map![json["countryName"]]!,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cityName": cityName,
        "countryName": countryNameValues.reverse[countryName],
        "__v": v,
      };
}

enum CountryName { UGANDA, GHANA, NIGERIA }

final countryNameValues = EnumValues({
  "Ghana": CountryName.GHANA,
  "Nigeria": CountryName.NIGERIA,
  "Uganda": CountryName.UGANDA
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

///previous
/*
import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
  Cities({
    required this.getCities,
  });

  final List<GetCity>? getCities;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        getCities: List<GetCity>.from(
            json["getCities"].map((x) => GetCity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getCities": List<dynamic>.from(getCities!.map((x) => x.toJson())),
      };
}

class GetCity {
  GetCity({
    required this.id,
    required this.cityName,
    required this.countryName,
    required this.v,
  });

  final String id;
  final String cityName;
  final CountryName countryName;
  final int v;

  factory GetCity.fromJson(Map<String, dynamic> json) => GetCity(
        id: json["_id"],
        cityName: json["cityName"],
        countryName: countryNameValues.map![json["countryName"]]!,
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cityName": cityName,
        "countryName": countryNameValues.reverse[countryName],
        "__v": v,
      };
}

enum CountryName { UGANDA, GHANA, NIGERIA }

final countryNameValues = EnumValues({
  "Ghana": CountryName.GHANA,
  "Nigeria": CountryName.NIGERIA,
  "Uganda": CountryName.UGANDA
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
*/
