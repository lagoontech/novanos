// To parse this JSON data, do
//
//     final checkIn = checkInFromJson(jsonString);

import 'dart:convert';

List<CheckIn> checkInFromJson(String str) =>
    List<CheckIn>.from(json.decode(str).map((x) => CheckIn.fromJson(x)));

String checkInToJson(List<CheckIn> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckIn {
  CheckIn({
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
    this.isVisitChkOut,
    this.transactionId,
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
  String? isVisitChkOut;
  String? transactionId;

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
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
        isVisitChkOut: json["IsVisitChkOut"],
        transactionId: json["TransactionId"],
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
        "IsVisitChkOut": isVisitChkOut,
        "TransactionId": transactionId,
      };
}
