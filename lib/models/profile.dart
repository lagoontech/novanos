// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

List<Profile> profileFromJson(String str) =>
    List<Profile>.from(json.decode(str).map((x) => Profile.fromJson(x)));

String profileToJson(List<Profile> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profile {
  Profile({
    this.employeeId,
    this.enrollmentId,
    this.gender,
    this.firstName,
    this.middleName,
    this.lastName,
    this.isManager,
    this.isAdmin,
    this.email,
    this.phone,
    this.mobile,
    this.managerId,
    this.employeeCategory,
    this.dateofBirth,
    this.shift,
    this.designation,
    this.department,
    this.branchId,
    this.companyId,
    this.active,
    this.dateofJoin,
    this.modified,
    this.created,
    this.createdBy,
    this.modifiedBy,
    this.isSysAdmin,
    this.workStatus,
    this.clientEnrollmentId,
    this.isOverTimeEligible,
    this.photo,
    this.maritalStatus,
    this.basicSalary,
    this.allowance,
    this.totalSalary,
    this.hourlyOvertimeRate,
    this.weekOffHourlyOvrtImeRate,
    this.employeeGroupId,
    this.hourlyRate,
    this.deployedDesignation,
    this.isSiteManager,
    this.isTimeKeeper,
    this.locationGroup,
    this.triggered,
    this.isMobileUser,
    this.lastLogin,
    this.userImage,
    this.type,
  });

  dynamic employeeId;
  String? enrollmentId;
  String? gender;
  String? firstName;
  String? middleName;
  String? lastName;
  String? isManager;
  String? isAdmin;
  String? email;
  String? phone;
  String? mobile;
  dynamic managerId;
  dynamic employeeCategory;
  DateTime? dateofBirth;
  dynamic shift;
  dynamic designation;
  dynamic department;
  dynamic branchId;
  dynamic companyId;
  String? active;
  DateTime? dateofJoin;
  DateTime? modified;
  DateTime? created;
  dynamic createdBy;
  dynamic modifiedBy;
  String? isSysAdmin;
  String? workStatus;
  String? clientEnrollmentId;
  bool? isOverTimeEligible;
  String? photo;
  String? maritalStatus;
  dynamic basicSalary;
  dynamic allowance;
  dynamic totalSalary;
  dynamic hourlyOvertimeRate;
  dynamic weekOffHourlyOvrtImeRate;
  dynamic employeeGroupId;
  dynamic hourlyRate;
  String? deployedDesignation;
  String? isSiteManager;
  String? isTimeKeeper;
  dynamic locationGroup;
  String? triggered;
  dynamic isMobileUser;
  String? lastLogin;
  String? userImage;
  String? type;

  factory Profile.fromJson(Map<String?, dynamic> json) => Profile(
        employeeId: json["EmployeeID"],
        enrollmentId: json["EnrollmentID"],
        gender: json["Gender"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        isManager: json["isManager"],
        isAdmin: json["isAdmin"],
        email: json["Email"],
        phone: json["Phone"],
        mobile: json["Mobile"],
        managerId: json["ManagerID"],
        employeeCategory: json["EmployeeCategory"],
        dateofBirth: DateTime.parse(json["DateofBirth"]),
        shift: json["Shift"],
        designation: json["Designation"],
        department: json["Department"],
        branchId: json["BranchID"],
        companyId: json["CompanyID"],
        active: json["Active"],
        dateofJoin: DateTime.parse(json["DateofJoin"]),
        modified: DateTime.parse(json["Modified"]),
        created: DateTime.parse(json["Created"]),
        createdBy: json["CreatedBy"],
        modifiedBy: json["ModifiedBy"],
        isSysAdmin: json["IsSysAdmin"],
        workStatus: json["WorkStatus"],
        clientEnrollmentId: json["ClientEnrollmentID"],
        isOverTimeEligible: json["IsOverTimeEligible"],
        photo: json["Photo"],
        maritalStatus: json["MaritalStatus"],
        basicSalary: json["BasicSalary"],
        allowance: json["Allowance"],
        totalSalary: json["TotalSalary"],
        hourlyOvertimeRate: json["HourlyOvertimeRate"],
        weekOffHourlyOvrtImeRate: json["WeekOffHourlyOvrtImeRate"],
        employeeGroupId: json["EmployeeGroupID"],
        hourlyRate: json["HourlyRate"],
        deployedDesignation: json["DeployedDesignation"],
        isSiteManager: json["IsSiteManager"],
        isTimeKeeper: json["IsTimeKeeper"],
        locationGroup: json["LocationGroup"],
        triggered: json["Triggered"],
        isMobileUser: json["IsMobileUser"],
        lastLogin: json["LastLogin"],
        userImage: json["UserImage"],
        type: json["Type"],
      );

  Map<String, dynamic> toJson() => {
        "EmployeeID": employeeId,
        "EnrollmentID": enrollmentId,
        "Gender": gender,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "isManager": isManager,
        "isAdmin": isAdmin,
        "Email": email,
        "Phone": phone,
        "Mobile": mobile,
        "ManagerID": managerId,
        "EmployeeCategory": employeeCategory,
        "DateofBirth": dateofBirth!.toIso8601String(),
        "Shift": shift,
        "Designation": designation,
        "Department": department,
        "BranchID": branchId,
        "CompanyID": companyId,
        "Active": active,
        "DateofJoin": dateofJoin!.toIso8601String(),
        "Modified": modified!.toIso8601String(),
        "Created": created!.toIso8601String(),
        "CreatedBy": createdBy,
        "ModifiedBy": modifiedBy,
        "IsSysAdmin": isSysAdmin,
        "WorkStatus": workStatus,
        "ClientEnrollmentID": clientEnrollmentId,
        "IsOverTimeEligible": isOverTimeEligible,
        "Photo": photo,
        "MaritalStatus": maritalStatus,
        "BasicSalary": basicSalary,
        "Allowance": allowance,
        "TotalSalary": totalSalary,
        "HourlyOvertimeRate": hourlyOvertimeRate,
        "WeekOffHourlyOvrtImeRate": weekOffHourlyOvrtImeRate,
        "EmployeeGroupID": employeeGroupId,
        "HourlyRate": hourlyRate,
        "DeployedDesignation": deployedDesignation,
        "IsSiteManager": isSiteManager,
        "IsTimeKeeper": isTimeKeeper,
        "LocationGroup": locationGroup,
        "Triggered": triggered,
        "IsMobileUser": isMobileUser,
        "LastLogin": lastLogin,
        "UserImage": userImage,
        "Type": type,
      };
}
