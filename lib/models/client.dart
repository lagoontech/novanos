// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

List<Client> clientFromJson(String str) =>
    List<Client>.from(json.decode(str).map((x) => Client.fromJson(x)));

String clientToJson(List<Client> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Client {
  Client({
    this.id,
    this.customerName,
    this.contactPerson,
    this.designation,
    this.location,
    this.product,
    this.estimatedDateofVisit,
    this.actualDateofVisit,
  });

  int? id;
  String? customerName;
  String? contactPerson;
  String? designation;
  String? location;
  String? product;
  DateTime? estimatedDateofVisit;
  DateTime? actualDateofVisit;

  factory Client.fromJson(Map<String?, dynamic> json) => Client(
        id: json["ID"],
        customerName: json["CustomerName"],
        contactPerson: json["ContactPerson"],
        designation: json["Designation"],
        location: json["Location"],
        product: json["Product"],
        estimatedDateofVisit: DateTime.parse(json["EstimatedDateofVisit"]),
        actualDateofVisit: DateTime.parse(json["ActualDateofVisit"]),
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CustomerName": customerName,
        "ContactPerson": contactPerson,
        "Designation": designation,
        "Location": location,
        "Product": product,
        "EstimatedDateofVisit": estimatedDateofVisit!.toIso8601String(),
        "ActualDateofVisit": actualDateofVisit!.toIso8601String(),
      };
}
