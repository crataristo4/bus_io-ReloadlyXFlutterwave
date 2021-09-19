import 'dart:convert';

import 'package:bus_io/model/bus.dart';

//final bookings = bookingsFromJson(jsonString);

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  Bookings({
    required this.id,
    required this.from,
    required this.to,
    required this.bookingDate,
    required this.details,
    required this.bus,
  });

  final String id;
  final String from;
  final String to;
  final String bookingDate;
  final List<Details> details;
  final Bus bus;

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        id: json["id"],
        from: json["from"],
        to: json["to"],
        bookingDate: json["bookingDate"],
        details:
            List<Details>.from(json["details"].map((x) => Details.fromJson(x))),
        bus: Bus.fromJson(json["bus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "from": from,
        "to": to,
        "bookingDate": bookingDate,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "bus": bus.toJson(),
      };
}

class Details {
  Details({
    required this.passengerName,
    required this.seatNo,
  });

  final String passengerName;
  final String seatNo;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        passengerName: json["passengerName"],
        seatNo: json["seatNo"],
      );

  Map<String, dynamic> toJson() => {
        "passengerName": passengerName,
        "seatNo": seatNo,
      };
}

List<Bookings> bookingList = [
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
        Details(passengerName: "passenger 2", seatNo: "10"),
        Details(passengerName: "passenger 2", seatNo: "10"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/a.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/b.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "5"),
      ],
      bus: Bus(
          busImage: "assets/images/a.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/b.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/a.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/b.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/a.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
  Bookings(
      id: 'id',
      from: "Lagos",
      to: "Accra",
      bookingDate: "30/09/2021",
      details: [
        Details(passengerName: "passenger 1", seatNo: "1"),
        Details(passengerName: "passenger 2", seatNo: "10"),
      ],
      bus: Bus(
          busImage: "assets/images/b.png",
          source: "kandahar",
          busName: "somting",
          rating: 4.6,
          numberOfRating: 156,
          departureDay: "hjhj",
          departureTime: "jkjkkj",
          estimatedTime: "20 hrs",
          numberOfSeats: 24,
          remainingSeats: [
            13,
            12,
            10,
            4,
            8,
            9,
            5,
          ],
          price: 36840)),
];
