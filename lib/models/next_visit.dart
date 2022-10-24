// To parse this JSON data, do
//
//     final nextVisit = nextVisitFromJson(jsonString);

import 'dart:convert';

List<NextVisit> nextVisitFromJson(String str) =>
    List<NextVisit>.from(json.decode(str).map((x) => NextVisit.fromJson(x)));

String nextVisitToJson(List<NextVisit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NextVisit {
  NextVisit({
    this.id,
    this.customerName,
    this.contactPerson,
    this.designation,
    this.location,
    this.product,
    this.estimatedDateOfVisit,
    this.actualDateofVisit,
    this.leadSource,
    this.clientId,
  });

  int? id;
  String? customerName;
  String? contactPerson;
  String? designation;
  String? location;
  String? product;
  DateTime? estimatedDateOfVisit;
  DateTime? actualDateofVisit;
  String? leadSource;
  String? clientId;

  factory NextVisit.fromJson(Map<String, dynamic> json) => NextVisit(
        id: json["Id"],
        customerName: json["CustomerName"],
        contactPerson: json["ContactPerson"],
        designation: json["Designation"],
        location: json["Location"],
        product: json["Product"],
        estimatedDateOfVisit: DateTime.parse(json["EstimatedDateOfVisit"]),
        actualDateofVisit: DateTime.parse(json["ActualDateofVisit"]),
        leadSource: json["LeadSource"],
        clientId: json["ClientId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CustomerName": customerName,
        "ContactPerson": contactPerson,
        "Designation": designation,
        "Location": location,
        "Product": product,
        "EstimatedDateOfVisit": estimatedDateOfVisit!.toIso8601String(),
        "ActualDateofVisit": actualDateofVisit!.toIso8601String(),
        "LeadSource": leadSource,
        "ClientId": clientId,
      };
}
