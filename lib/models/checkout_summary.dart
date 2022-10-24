// To parse this JSON data, do
//
//     final checkOutSummary = checkOutSummaryFromJson(jsonString);

import 'dart:convert';

List<CheckOutSummary> checkOutSummaryFromJson(String str) =>
    List<CheckOutSummary>.from(
        json.decode(str).map((x) => CheckOutSummary.fromJson(x)));

String checkOutSummaryToJson(List<CheckOutSummary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckOutSummary {
  CheckOutSummary({
    this.id,
    this.customerName,
    this.contactPerson,
    this.designation,
    this.location,
    this.checkTimeLocation,
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
  String? checkTimeLocation;
  String? product;
  DateTime? estimatedDateOfVisit;
  DateTime? actualDateofVisit;
  String? leadSource;
  String? clientId;
  String? isVisitChkOut;
  String? transactionId;

  factory CheckOutSummary.fromJson(Map<String, dynamic> json) =>
      CheckOutSummary(
        id: json["Id"],
        customerName: json["CustomerName"],
        contactPerson: json["ContactPerson"],
        designation: json["Designation"],
        location: json["Location"],
        checkTimeLocation: json["CheckTimeLocation"],
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
        "CheckTimeLocation": checkTimeLocation,
        "Product": product,
        "EstimatedDateOfVisit": estimatedDateOfVisit!.toIso8601String(),
        "ActualDateofVisit": actualDateofVisit!.toIso8601String(),
        "LeadSource": leadSource,
        "ClientId": clientId,
        "IsVisitChkOut": isVisitChkOut,
        "TransactionId": transactionId,
      };
}
