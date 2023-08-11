// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  int id;
  String name;
  String username;
  String email;
  Address address;

  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
      };
}

class Address {
  String street;

  Address({
    required this.street,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
      };
}
