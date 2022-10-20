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
  });

  String? name;
  String? designationName;
  String? departmentName;
  String? checkin;
  String? checckOut;
  String? firstLocation;
  String? lastLocation;
  String? workHours;

  factory SummaryReport.fromJson(Map<String, dynamic> json) => SummaryReport(
        name: json["Name"],
        designationName: json["DesignationName"],
        departmentName: json["DepartmentName"],
        checkin: json["Checkin"],
        checckOut: json["ChecckOut"],
        firstLocation: json["FirstLocation"],
        lastLocation: json["LastLocation"],
        workHours: json["WorkHours"],
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
      };
}
