// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.name,
    this.id,
    this.geofenceUser,
    this.latitute,
    this.longitude,
    this.location,
    this.dimeter,
    this.locationDateTime,
    this.companyName,
    this.departmentName,
  });

  String? status;
  String? name;
  String? id;
  String? geofenceUser;
  String? latitute;
  String? longitude;
  dynamic location;
  String? dimeter;
  DateTime? locationDateTime;
  String? companyName;
  String? departmentName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        name: json["Name"],
        id: json["ID"],
        geofenceUser: json["GeofenceUser"],
        latitute: json["Latitute"],
        longitude: json["Longitude"],
        location: json["Location"],
        dimeter: json["Dimeter"],
        locationDateTime: DateTime.parse(json["LocationDateTime"]),
        companyName: json["CompanyName"],
        departmentName: json["DepartmentName"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Name": name,
        "ID": id,
        "GeofenceUser": geofenceUser,
        "Latitute": latitute,
        "Longitude": longitude,
        "Location": location,
        "Dimeter": dimeter,
        "LocationDateTime": locationDateTime!.toIso8601String(),
        "CompanyName": companyName,
        "DepartmentName": departmentName,
      };
}
