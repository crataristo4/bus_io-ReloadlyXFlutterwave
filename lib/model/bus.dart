import 'dart:convert';

Bus slotsFromJson(String str) => Bus.fromJson(json.decode(str));

class Bus {
  final busId;
  final busImage;
  final source;
  final busName;
  final rating;
  final numberOfRating;
  final departureDay;
  final departureTime;
  final estimatedTime;
  final numberOfSeats;
  final List remainingSeats;
  final price;

  Bus(
      {this.busId,
      required this.busImage,
      required this.source,
      required this.busName,
      required this.rating,
      required this.numberOfRating,
      required this.departureDay,
      required this.departureTime,
      required this.estimatedTime,
      required this.numberOfSeats,
      required this.remainingSeats,
      required this.price});

  factory Bus.fromJson(Map<String, dynamic> json) => Bus(
        busId: json["busId"],
        busImage: json["busImage"],
        source: json["source"],
        busName: json["busName"],
        rating: json["rating"],
        numberOfRating: json["numberOfRating"],
        departureDay: json["departureDay"],
        departureTime: json["departureTime"],
        estimatedTime: json["estimatedTime"],
        numberOfSeats: json["numberOfSeats"],
        price: json["price"],
        remainingSeats: List<String>.from(json["remainingSeats"].map((x) => x)),
      );
}

List<Bus> busList = [
  Bus(
      busImage: 'assets/images/a.png',
      source: "GOD IS GOOD MOTORS",
      busName: "Toyota Hiace",
      rating: 4.5,
      numberOfRating: 134,
      departureDay: 'Thursday, 8th July 2021',
      departureTime: '11:15 am',
      estimatedTime: '15 hrs',
      numberOfSeats: 14,
      remainingSeats: [2, 5, 8, 9, 10, 12, 1, 3, 6],
      price: '20,500'),
  Bus(
      busImage: 'assets/images/a.png',
      source: "CHISCO MOTORS",
      busName: "Toyota Hiace",
      rating: 4.5,
      numberOfRating: 134,
      departureDay: 'Thursday, 8th July 2021',
      departureTime: '11:15 am',
      estimatedTime: '15 hrs',
      numberOfSeats: 50,
      remainingSeats: [
        5,
        8,
        9,
        10,
        12,
        5,
        8,
        9,
        10,
        12,
        5,
        8,
        9,
        10,
        12,
      ],
      price: '24,500'),
  Bus(
      busImage: 'assets/images/b.png',
      source: "LIBRA MOTORS",
      busName: "Toyota Coaster",
      rating: 4.1,
      numberOfRating: 94,
      departureDay: 'Thursday, 8th July 2021',
      departureTime: '08:15 am',
      estimatedTime: '14 hrs',
      numberOfSeats: 26,
      remainingSeats: [2, 5, 8, 9, 10, 12, 17, 20, 22],
      price: '28,500'),
];
