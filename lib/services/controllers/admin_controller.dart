import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novanas/models/employee.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../api_urls.dart';

class AdminController extends GetxController {
  List<Employee> employeeList = [];
  Future<List<Employee>?> getEmployeeList() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;

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
}
