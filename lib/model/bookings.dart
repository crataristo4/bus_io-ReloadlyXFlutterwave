import 'dart:convert';

//final bookings = bookingsFromJson(jsonString);

Bookings bookingsFromJson(String str) => Bookings.fromJson(json.decode(str));

String bookingsToJson(Bookings data) => json.encode(data.toJson());

class Bookings {
  Bookings({
    required this.bookingId,
    required this.userId,
    required this.from,
    required this.to,
    required this.bookingDate,
    required this.details,
    required this.source,
    required this.busName,
    required this.busImage,
    required this.ticketPrice,
    required this.totalPrice,
    required this.departureTime,
    required this.departureDay,
  });

  final String bookingId, userId;
  final String from;
  final String to;
  final String bookingDate;
  final source;
  final busName;
  final busImage;
  final departureTime;
  final departureDay;
  final ticketPrice;
  final totalPrice;
  final List<Details> details;

  // final GetBus bus;

  factory Bookings.fromJson(Map<String, dynamic> json) => Bookings(
        bookingId: json["bookingId"],
        userId: json["userId"],
        from: json["from"],
        to: json["to"],
        source: json["source"],
        departureDay: json["departureDay"],
        departureTime: json["departureTime"],
        busName: json["busName"],
        busImage: json["busImage"],
        ticketPrice: json["ticketPrice"],
        totalPrice: json["totalPrice"],
        bookingDate: json["bookingDate"],
        details:
            List<Details>.from(json["details"].map((x) => Details.fromJson(x))),
        //   bus: GetBus.fromJson(json["getBuses"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId,
        "userId": userId,
        "from": from,
        "to": to,
        "departureTime": departureTime,
        "departureDay": departureDay,
        "bookingDate": bookingDate,
        "source": source,
        "busName": busName,
        "busImage": busImage,
        "ticketPrice": ticketPrice,
        "totalPrice": totalPrice,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        //  "bus": bus.toJson(),
      };

  int getTotalFair() {
    return ticketPrice * details.length;
  }
}

///class contains passenger's name and seat number
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

/*List<Bookings> bookingList = [
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
          departureDay: "30/09/2021",
          departureTime: "08:00 am",
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
          departureDay: "30/09/2021",
          departureTime: "08:00 am",
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
          departureDay: "30/09/2021",
          departureTime: "08:00 am",
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
          departureDay: "30/09/2021",
          departureTime: "08:00 am",
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
          departureDay: "30/09/2021",
          departureTime: "08:00 am",
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
];*/
