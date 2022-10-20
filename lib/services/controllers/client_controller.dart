import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:novanas/helper/constant.dart';
import 'package:novanas/models/client.dart';
import 'package:novanas/models/leadsource.dart';
import 'package:novanas/models/product.dart';
import 'package:novanas/screens/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/connectivity_manager.dart';
import '../api_urls.dart';

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
        String url = URL.INSERT_CLIENT;
        var response = await Http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dataBody),
        );
        print(response.statusCode);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202) {
          await getClientList();
          Get.off(() => LoadingScreen());
          print('woirkung');

          Get.snackbar(
            'Successfully ',
            "added Client",
          );
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
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;
    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.PRODUCTS}${Uri(queryParameters: params).query}';

    Http.Response _response =
        await Http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (_response.statusCode == 200) {
      productList = [];
      productList = productFromJson(_response.body);

      return productList;
    } else {
      return null;
    }
  }

  Future<List<LeadSource>?> getLeadSource() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;
    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.LEAD_SOURCE_LIST}${Uri(queryParameters: params).query}';

    Http.Response _response =
        await Http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (_response.statusCode == 200) {
      leadsourceList = [];
      leadsourceList = leadSourceFromJson(_response.body);

      return leadsourceList;
    } else {
      return null;
    }
  }

  Future<List<Client>?> getClientList() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String employeeNo = sharedPreferences.getString('username')!;

    Map<String, dynamic> params = {'EmployeeNo': employeeNo};

    String url = '${URL.CLIENT_LIST}${Uri(queryParameters: params).query}';

    Http.Response _response =
        await Http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (_response.statusCode == 200) {
      clientList = [];
      clientList = clientFromJson(_response.body);

      return clientList;
    } else {
      return null;
    }
  }

  Future<void> checkVisit({
    required String checkStatus,
    required String checkComment,
    required Client client,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String employeeNo = sharedPreferences.getString('username')!;

    Map<String, dynamic> dataBody = {
      "ID": employeeNo,
      "Latitude": Constants.currentPosition!.latitude,
      "Longitude": Constants.currentPosition!.longitude,
      "CheckType": checkStatus,
      "CheckTime": DateTime.now().toString(),
      "ClientName": client.customerName,
      "ContactPerson": client.contactPerson.toString(),
      "Designation": client.designation.toString(),
      "Location": Constants.currentAddress,
      "Product": client.product.toString(),
      "EstimatedDateOfVisit": client.estimatedDateofVisit.toString(),
      "Comment": checkComment,
      "ClientId": client.id.toString(),
    };

    if (await ConnectivityManager.connected()) {
      try {
        String url = URL.CHECK;
        var response = await Http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dataBody),
        );
        print(response.statusCode);
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 202) {
          Get.back();
          print('woirkung');

          Get.snackbar(
            'Successfully ',
            "Checked IN",
          );
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
