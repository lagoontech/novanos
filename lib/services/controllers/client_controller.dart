import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:novanas/models/client.dart';
import 'package:novanas/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/connectivity_manager.dart';
import '../api_urls.dart';

class ClientController extends GetxController {
  List<Product> productList = [];
  List<Client> clientList = [];

  @override
  void onInit() async {
    await getProducts();
    await getClientList();

    super.onInit();
  }

  Future<void> insertClient(Map<String, dynamic> dataBody) async {
    if (await ConnectivityManager.connected()) {
      try {
        String url = '${URL.INSERT_CLIENT}';
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
    Map<String, dynamic> params = {'EmployeeNo=': 'NG-971007'};

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

  Future<List<Client>?> getClientList() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    String employeeNo = sharedPreferences.getString('username')!;
    print(employeeNo);
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
}
