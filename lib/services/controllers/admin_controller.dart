import 'dart:convert';
import 'package:get/get.dart';
import 'package:novanas/models/employee.dart';
import 'package:novanas/screens/admin/pages/schedule_requests.dart';
import 'package:novanas/screens/loading_screen.dart';
import 'package:novanas/services/controllers/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../helper/connectivity_manager.dart';
import '../../models/schedule_request.dart';
import '../api_urls.dart';
import '../auth_service.dart';
import '../date_service.dart';

class AdminController extends GetxController {
  List<Employee> employeeList = [];
  var scheduleRequestList = [].obs;

  DashBoardController dashBoardController = Get.find();
  Future<List<Employee>?> getEmployeeList() async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> params = {
      'EmployeeNo': employeeNo,
    };

    String url = '${URL.employeeListURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      employeeList = [];

      employeeList = employeeFromJson(response.body);

      return employeeList;
    } else {
      return null;
    }
  }

  Future<RxList?> getScheduleRequests() async {
    String employeeNo = await AuthService().getEmpId();
    var now = DateTime.now();

// Find the last day of the month.
    var beginningPastMonth = (now.month < 12)
        ? DateTime(now.year, now.month, 1)
        : DateTime(now.year - 1, 1, 1);

    int lastday = DateTime(now.year, now.month + 1, 0).day;
    String lastDate = '${now.month}-$lastday-${now.year}';

    Map<String, dynamic> params = {
      'FromDate':
          DateService.getFormatedhypenDate(beginningPastMonth).toString(),
      'EndDate': lastDate,
      'EmployeeNo': employeeNo,
    };

    String url =
        '${URL.scheduleRequestURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      scheduleRequestList.value = [];

      scheduleRequestList.value = scheduleRequestFromJson(response.body);

      return scheduleRequestList;
    } else {
      return null;
    }
  }

  Future<void> scheduleRequestApprove({
    required String id,
  }) async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> dataBody = {
      "ID": "1",
      "AdminEmpId": employeeNo.toString(),
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.scheduleRequestApprove;
        var response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dataBody),
        );

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202) {
          await getScheduleRequests();
          await dashBoardController.getNextClient();
          print(scheduleRequestList.length);
          Get.off(() => const LoadingScreen());
        }
      } catch (e) {
        Get.snackbar(
          "Try Again",
          "Something went wrong, Please try again!",
        );
      }
    } else {
      Get.snackbar(
        'Connection failed',
        "No Internet connection",
      );
    }
  }

  Future<void> scheduleRequestReject({
    required String id,
  }) async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> dataBody = {
      "ID": "1",
      "AdminEmpId": employeeNo,
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.scheduleRequestApprove;
        var response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dataBody),
        );

        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202) {
          await getScheduleRequests();
          await dashBoardController.getNextClient();
          print(scheduleRequestList.length);
          Get.off(() => const LoadingScreen());
        }
      } catch (e) {
        Get.snackbar(
          "Try Again",
          "Something went wrong, Please try again!",
        );
      }
    } else {
      Get.snackbar(
        'Connection failed',
        "No Internet connection",
      );
    }
  }
}
