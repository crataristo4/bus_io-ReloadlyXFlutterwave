import 'dart:convert';

Users userFromJson(String str) => Users.fromJson(json.decode(str));

String busToJson(Users data) => json.encode(data.toJson());

class Users {
  final id;
  final firstName;
  final lastName;
  final email;
  final phoneNumber;
  String? imageUrl;
  String? from;
  String? to;
  String? currentCity;

  Users(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.imageUrl,
      this.currentCity,
      this.from,
      this.to});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        from: json["from"],
        to: json["to"],
        imageUrl: json["imageUrl"],
        currentCity: json["currentCity"],
      );

  Map<String, dynamic> toJson() =>
      {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "from": from,
        "to": to,
        "imageUrl": imageUrl,
        "currentCity": currentCity,
      };
}
