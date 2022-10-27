import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthService {
  Future<void> saveUserDetails(
      {required String userName, required String userPassword}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("username", userName);
    sharedPreferences.setString("password", userPassword);
  }

  Future<String> getEmpId() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;
    return employeeNo;
  }

  void savePref(
      {required String id,
      required String name,
      required String companyName,
      required String departmentName,
      required String geofenceUser,
      required String geofenceLat,
      required String geofenceLong,
      required String dimeter}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.setString("id", id);
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("companyName", companyName);
    sharedPreferences.setString("departmentName", departmentName);
    sharedPreferences.setString("geofenceUser", geofenceUser);
    sharedPreferences.setString("geofenceLat", geofenceLat);
    sharedPreferences.setString("geofenceLong", geofenceLong);
    sharedPreferences.setString("dimeter", dimeter);
  }

  void saveUser(User user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String userString = jsonEncode(user);

    sharedPreferences.setString("user", userString);
  }

  Future<User?> getUser() async {
    User user;
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userString = sharedPreferences.getString("user");

    if (userString != null) {
      user = userFromJson(userString);
      return user;
    }
    return null;
  }

  saveAuthentication(bool isAuthenticate) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool("isAuthenticate", isAuthenticate);
  }

  Future<bool> getAuthentication() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    bool isLogin = sharedPreferences.getBool("isAuthenticate") ?? false;
    return isLogin;
  }

  saveCheckInTime(String checkInTime) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("checkInTime", checkInTime);
  }

  saveCheckOutTime(String checkOutTime) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("checkOutTime", checkOutTime);
  }

  Future<void> clearSharedPref() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
