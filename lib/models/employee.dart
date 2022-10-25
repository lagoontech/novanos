// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  Employee({
    this.employeeId,
    this.enrollmentId,
    this.gender,
    this.name,
    this.isManager,
    this.isAdmin,
    this.email,
    this.mobile,
    this.managerId,
    this.dateofBirth,
    this.employeeCategory,
    this.designationName,
    this.departmentName,
    this.shiftName,
    this.branchName,
    this.companyName,
    this.workStatus,
    this.clientEnrollmentId,
    this.mobileRole,
    this.mobileStatus,
    this.mobileCode,
    this.isMobileUser,
    this.userImage,
    this.lastLogin,
  });

  int? employeeId;
  String? enrollmentId;
  String? gender;
  String? name;
  String? isManager;
  String? isAdmin;
  String? email;
  String? mobile;
  int? managerId;
  DateTime? dateofBirth;
  int? employeeCategory;
  String? designationName;
  String? departmentName;
  String? shiftName;
  String? branchName;
  String? companyName;
  String? workStatus;
  int? clientEnrollmentId;
  int? mobileRole;
  bool? mobileStatus;
  String? mobileCode;
  String? isMobileUser;
  String? userImage;
  String? lastLogin;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        employeeId: json["EmployeeID"],
        enrollmentId: json["EnrollmentID"],
        gender: json["Gender"],
        name: json["Name"],
        isManager: json["isManager"],
        isAdmin: json["isAdmin"],
        email: json["Email"],
        mobile: json["Mobile"],
        managerId: json["ManagerID"],
        dateofBirth: DateTime?.parse(json["DateofBirth"]),
        employeeCategory: json["EmployeeCategory"],
        designationName: json["DesignationName"],
        departmentName: json["DepartmentName"],
        shiftName: json["ShiftName"],
        branchName: json["BranchName"],
        companyName: json["CompanyName"],
        workStatus: json["WorkStatus"],
        clientEnrollmentId: json["ClientEnrollmentID"],
        mobileRole: json["MobileRole"],
        mobileStatus: json["MobileStatus"],
        mobileCode: json["MobileCode"],
        isMobileUser: json["IsMobileUser"],
        userImage: json["UserImage"],
        lastLogin: json["LastLogin"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeID": employeeId,
        "EnrollmentID": enrollmentId,
        "Gender": gender,
        "Name": name,
        "isManager": isManager,
        "isAdmin": isAdmin,
        "Email": email,
        "Mobile": mobile,
        "ManagerID": managerId,
        "DateofBirth": dateofBirth!.toIso8601String(),
        "EmployeeCategory": employeeCategory,
        "DesignationName": designationName,
        "DepartmentName": departmentName,
        "ShiftName": shiftName,
        "BranchName": branchName,
        "CompanyName": companyName,
        "WorkStatus": workStatus,
        "ClientEnrollmentID": clientEnrollmentId,
        "MobileRole": mobileRole,
        "MobileStatus": mobileStatus,
        "MobileCode": mobileCode,
        "IsMobileUser": isMobileUser,
        "UserImage": userImage,
        "LastLogin": lastLogin,
      };
}
