import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:novanas/helper/constant.dart';
import 'package:novanas/models/client.dart';
import 'package:novanas/models/leadsource.dart';
import 'package:novanas/models/next_visit.dart';
import 'package:novanas/models/product.dart';
import 'package:novanas/screens/loading_screen.dart';
import 'package:novanas/services/controllers/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../helper/connectivity_manager.dart';
import '../../models/checkin.dart';
import '../api_urls.dart';
import '../auth_service.dart';
import 'summary_conrtoller.dart';

class ClientController extends GetxController {
  List<Product> productList = [];
  List<Client> clientList = [];
  List<LeadSource> leadsourceList = [];
  var isLoading = true.obs;

  @override
  void onInit() async {
    await getClientList();
    super.onInit();
  }

  Future<void> insertClient(Map<String, dynamic> dataBody) async {
    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.insertClientURL;
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
          await getClientList();
          DashBoardController dashBoardController = Get.find();
          await dashBoardController.getCheckInClients();
          await dashBoardController.getNextClient();
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

  Future<List<Product>?> getProducts() async {
    String employeeNo = await AuthService().getEmpId();
    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.productURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      productList = [];
      productList = productFromJson(response.body);

      return productList;
    } else {
      return null;
    }
  }

  Future<List<LeadSource>?> getLeadSource() async {
    String employeeNo = await AuthService().getEmpId();
    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url =
        '${URL.leadSourceListURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      leadsourceList = [];
      leadsourceList = leadSourceFromJson(response.body);

      return leadsourceList;
    } else {
      return null;
    }
  }

  Future<List<Client>?> getClientList() async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.clientListURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      clientList = [];
      clientList = clientFromJson(response.body);

      return clientList;
    } else {
      return null;
    }
  }

  Future<void> checkInVisit({
    required String checkStatus,
    required String checkComment,
    required NextVisit nextVisit,
  }) async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> dataBody = {
      "ID": employeeNo,
      "Latitude": Constants.currentPosition!.latitude,
      "Longitude": Constants.currentPosition!.longitude,
      "CheckType": checkStatus,
      "CheckTime": DateTime.now().toString(),
      "ClientName": nextVisit.customerName,
      "ContactPerson": nextVisit.contactPerson.toString(),
      "Designation": nextVisit.designation.toString(),
      "Location": nextVisit.location.toString(),
      "CheckTimeLocation": Constants.currentAddress,
      "Product": nextVisit.product.toString(),
      "EstimatedDateOfVisit": nextVisit.estimatedDateOfVisit.toString(),
      "Comment": checkComment,
      "LeadSource": nextVisit.leadSource.toString(),
      "ClientId": nextVisit.id.toString(),
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.checkInURL;
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
          await getClientList();

          DashBoardController dashBoardController = Get.find();
          await dashBoardController.getCheckInClients();
          await dashBoardController.getNextClient();
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

  Future<void> checkOutVisit({
    required String checkStatus,
    required String checkComment,
    required CheckIn checkInClient,
  }) async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> dataBody = {
      "Latitude": Constants.currentPosition!.latitude,
      "Longitude": Constants.currentPosition!.longitude,
      "CheckType": "OUT",
      "CheckTime": DateTime.now().toString(),
      "ClientName": checkInClient.customerName,
      "ContactPerson": checkInClient.contactPerson.toString(),
      "Designation": checkInClient.designation.toString(),
      "Location": checkInClient.location,
      "CheckTimeLocation": Constants.currentAddress,
      "Product": checkInClient.product.toString(),
      "EstimatedDateOfVisit": checkInClient.estimatedDateOfVisit.toString(),
      "Comment": checkComment.toString(),
      "TransactionId": checkInClient.transactionId.toString(),
      "LeadSource": checkInClient.leadSource.toString(),
      "ClientId": checkInClient.clientId.toString(),
      "EmployeeId": employeeNo.toString(),
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.checkOutURL;
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
          await getClientList();

          DashBoardController dashBoardController = Get.find();
          await dashBoardController.getCheckInClients();
          await dashBoardController.getNextClient();
          SummaryController summaryController = Get.find();
          summaryController.getCheckOutSummary();
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

  Future<void> scheduleClient(Map<String, dynamic> dataBody) async {
    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.scheduleClientURL;
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
          await getClientList();
          DashBoardController dashBoardController = Get.find();
          await dashBoardController.getCheckInClients();
          await dashBoardController.getNextClient();
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
