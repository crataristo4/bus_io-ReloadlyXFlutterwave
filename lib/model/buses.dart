// To parse this JSON data, do
//
//     final buses = busesFromJson(jsonString);

import 'dart:convert';

Buses busesFromJson(String str) => Buses.fromJson(json.decode(str));

String busesToJson(Buses data) => json.encode(data.toJson());

class Buses {
  Buses({
    required this.getBuses,
  });

  final List<GetBus>? getBuses;

  factory Buses.fromJson(Map<String, dynamic> json) => Buses(
        getBuses:
            List<GetBus>.from(json["getBuses"].map((x) => GetBus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getBuses": List<dynamic>.from(getBuses!.map((x) => x.toJson())),
      };
}

class GetBus {
  GetBus({
    required this.id,
    required this.busImage,
    required this.source,
    required this.busName,
    required this.averageRating,
    required this.numberOfRatings,
    required this.departureDay,
    required this.departureTime,
    required this.estimatedDuration,
    required this.numberOfSeats,
    required this.remainingSeats,
    required this.price,
    required this.v,
  });

  final String id;
  final String busImage;
  final String source;
  final String busName;
  final double averageRating;
  final int numberOfRatings;
  final DateTime departureDay;
  final String departureTime;
  final String estimatedDuration;
  final int numberOfSeats;
  final List remainingSeats;
  final int price;
  final int v;

  factory GetBus.fromJson(Map<String, dynamic> json) => GetBus(
        id: json["_id"],
        busImage: json["busImage"],
        source: json["source"],
        busName: json["busName"],
        averageRating: json["averageRating"].toDouble(),
        numberOfRatings: json["numberOfRatings"],
        departureDay: DateTime.parse(json["departureDay"]),
        departureTime: json["departureTime"],
        estimatedDuration: json["estimatedDuration"],
        numberOfSeats: json["numberOfSeats"],
        remainingSeats:
            List<dynamic>.from(json["remainingSeats"].map((x) => x)),
        price: json["price"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "busImage": busImage,
        "source": source,
        "busName": busName,
        "averageRating": averageRating,
        "numberOfRatings": numberOfRatings,
        "departureDay": departureDay.toIso8601String(),
        "departureTime": departureTime,
        "estimatedDuration": estimatedDuration,
        "numberOfSeats": numberOfSeats,
        "remainingSeats": List<dynamic>.from(remainingSeats.map((x) => x)),
        "price": price,
        "__v": v,
      };
}
