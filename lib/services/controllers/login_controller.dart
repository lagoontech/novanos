import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:novanas/models/profile.dart';
import 'package:novanas/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/connectivity_manager.dart';
import '../../helper/constant.dart';
import '../api_urls.dart';
import 'package:http/http.dart' as http;

import '../auth_service.dart';

class LoginController extends GetxController {
  List<Profile> profileDetails = [];
  var isLoading = false.obs;
  RxBool? canCheckBiometrics;
  final _authorized = 'Not Authorized'.obs;
  var isAuthenticating = false.obs;
  var authenticated = false.obs;

  @override
  void onInit() async {
    await getProfile();

    super.onInit();
  }

  Future<bool> loginWithUserDetails(
      {required String userName,
      required String passWord,
      BuildContext? context}) async {
    Map<String, String> params = {
      'UserName': userName,
      'password': passWord,
      'Loginlat': '${Constants.currentPosition!.longitude}',
      'LoginLon': '${Constants.currentPosition!.latitude}',
      'LoginLocation': Constants.currentAddress ?? 'Not Available',
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url_ = "${URL.LOGIN}${Uri(queryParameters: params).query}";

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
          await getProfile();
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

  Future<List<Profile>?> getProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String employeeNo = sharedPreferences.getString('username')!;

    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.PROFILE}${Uri(queryParameters: params).query}';

    final response = await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      profileDetails = [];
      profileDetails = profileFromJson(response.body);
      return profileDetails;
    } else {
      return null;
    }
  }

  Future<bool> authenticate() async {
    final LocalAuthentication auth = LocalAuthentication();

    try {
      isAuthenticating.value = true;
      _authorized.value = 'Authenticating';

      authenticated.value = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: true),
      );

      isAuthenticating.value = false;
    } on PlatformException catch (e) {
      isAuthenticating.value = false;
      _authorized.value = 'Error - ${e.message}';
    }

    _authorized.value = authenticated.value ? 'Authorized' : 'Not Authorized';

    if (authenticated.value) {
      return true;
    } else {
      return false;
    }
  }
}
