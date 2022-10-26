// To parse this JSON data, do
//
//     final summaryReport = summaryReportFromJson(jsonString);

import 'dart:convert';

List<SummaryReport> summaryReportFromJson(String str) =>
    List<SummaryReport>.from(
        json.decode(str).map((x) => SummaryReport.fromJson(x)));

String summaryReportToJson(List<SummaryReport> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SummaryReport {
  SummaryReport({
    this.name,
    this.designationName,
    this.departmentName,
    this.checkin,
    this.checckOut,
    this.firstLocation,
    this.lastLocation,
    this.workHours,
    this.clientName,
    this.leadSource,
    this.product,
    this.inComment,
    this.outComment,
  });

  String? name;
  String? designationName;
  String? departmentName;
  String? checkin;
  String? checckOut;
  String? firstLocation;
  String? lastLocation;
  String? workHours;
  String? clientName;
  String? leadSource;
  String? product;
  String? inComment;
  String? outComment;

  factory SummaryReport.fromJson(Map<String, dynamic> json) => SummaryReport(
        name: json["Name"],
        designationName: json["DesignationName"],
        departmentName: json["DepartmentName"],
        checkin: json["Checkin"],
        checckOut: json["ChecckOut"],
        firstLocation: json["FirstLocation"],
        lastLocation: json["LastLocation"],
        workHours: json["WorkHours"],
        clientName: json["ClientName"],
        leadSource: json["LeadSource"],
        product: json["Product"],
        inComment: json["InComment"],
        outComment: json["OutComment"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "DesignationName": designationName,
        "DepartmentName": departmentName,
        "Checkin": checkin,
        "ChecckOut": checckOut,
        "FirstLocation": firstLocation,
        "LastLocation": lastLocation,
        "WorkHours": workHours,
        "ClientName": clientName,
        "LeadSource": leadSource,
        "Product": product,
        "InComment": inComment,
        "OutComment": outComment,
      };
}
