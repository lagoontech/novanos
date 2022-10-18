import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/user.dart';
import '../../helper/connectivity_manager.dart';
import '../api_urls.dart';
import 'package:http/http.dart' as http;

import '../auth_service.dart';

class LoginController extends GetxController {
  Future<bool> loginWithUserDetails(
      {required String userName,
      required String passWord,
      BuildContext? context}) async {
    String CheckType = "Android_IN";
    if (Platform.isAndroid) {
      CheckType = "Android_IN";
    } else if (Platform.isIOS) {
      CheckType = "IN";
    }

    String latitude = '3423234';
    String longitude = '23434';
    String loginLocation = '23434';

    Map<String, String> params = {
      'UserName': userName,
      'password': passWord,
      'Loginlat': latitude,
      'LoginLon': longitude,
      'LoginLocation': 'loginLocation'
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url_ = "${URL.LOGIN}${Uri(queryParameters: params).query}";
        print(url_);
        final response = await http.get(
          Uri.parse(url_),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 200) {
          User userReponse = userFromJson(response.body);
          AuthService().saveAuthentication(true);

          await AuthService()
              .saveUserDetails(userName: userName, userPassword: passWord);
          AuthService().savePref(
              id: userReponse.id!,
              name: userReponse.name!,
              companyName: userReponse.companyName!,
              departmentName: userReponse.departmentName!,
              geofenceLat: userReponse.latitute!,
              geofenceLong: userReponse.longitude!,
              dimeter: userReponse.dimeter!,
              geofenceUser: userReponse.geofenceUser!);

          return true;
        } else {
          Get.snackbar('Something Went Wrong', 'Please try again!');
          return false;
        }
      } catch (e) {
        Get.snackbar(e.toString(), 'Please try again!');
        return false;
      }
    } else {
      Get.snackbar(
          'Connection Failed', 'Please check your network connection!');
      return false;
    }
  }
}
