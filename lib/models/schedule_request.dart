// To parse this JSON data, do
//
//     final scheduleRequest = scheduleRequestFromJson(jsonString);

import 'dart:convert';

List<ScheduleRequest> scheduleRequestFromJson(String str) =>
    List<ScheduleRequest>.from(
        json.decode(str).map((x) => ScheduleRequest.fromJson(x)));

String scheduleRequestToJson(List<ScheduleRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleRequest {
  ScheduleRequest({
    this.id,
    this.customerName,
    this.contactPerson,
    this.designation,
    this.location,
    this.product,
    this.estimatedDateOfVisit,
    this.actualDateofVisit,
    this.employeeName,
    this.employeeDesignation,
    this.employeeDepartment,
    this.employeeProfile,
  });

  int? id;
  String? customerName;
  String? contactPerson;
  String? designation;
  String? location;
  String? product;
  DateTime? estimatedDateOfVisit;
  DateTime? actualDateofVisit;
  String? employeeName;
  String? employeeDesignation;
  String? employeeDepartment;
  String? employeeProfile;

  factory ScheduleRequest.fromJson(Map<String, dynamic> json) =>
      ScheduleRequest(
        id: json["Id"],
        customerName: json["CustomerName"],
        contactPerson: json["ContactPerson"],
        designation: json["Designation"],
        location: json["Location"],
        product: json["Product"],
        estimatedDateOfVisit: DateTime.parse(json["EstimatedDateOfVisit"]),
        actualDateofVisit: DateTime.parse(json["ActualDateofVisit"]),
        employeeName: json["EmployeeName"],
        employeeDesignation: json["EmployeeDesignation"],
        employeeDepartment: json["EmployeeDepartment"],
        employeeProfile: json["EmployeeProfile"],
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
        "EmployeeName": employeeName,
        "EmployeeDesignation": employeeDesignation,
        "EmployeeDepartment": employeeDepartment,
        "EmployeeProfile": employeeProfile,
      };
}
