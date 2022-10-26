import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novanas/models/checkin.dart';
import 'package:novanas/models/next_visit.dart';
import 'package:novanas/services/date_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../api_urls.dart';

class DashBoardController extends GetxController {
  List<NextVisit> nextClientsList = [];
  List<CheckIn> checkInClientsList = [];

  @override
  void onInit() async {
    await getNextClient();
    await getCheckInClients();
    super.onInit();
  }

  Future<List<NextVisit>?> getNextClient() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;

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

    String url = '${URL.nextVisitListURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      nextClientsList = [];

      nextClientsList = nextVisitFromJson(response.body);

      return nextClientsList;
    } else {
      return null;
    }
  }

  Future<List<CheckIn>?> getCheckInClients() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;

    var now = DateTime.now();

    var beginningPastMonth = (now.month < 12)
        ? DateTime(now.year, now.month, 1)
        : DateTime(now.year - 1, 1, 1);

    int lastday = DateTime(now.year, now.month + 1, 0).day;
    String lastDate = '${now.month}-$lastday-${now.year}';

    Map<String, dynamic> params = {
      'FromDate': DateService.getFormatedhypenDate(beginningPastMonth),
      'EndDate': lastDate,
      'EmployeeNo': employeeNo,
    };

    String url = '${URL.checkInListURL}${Uri(queryParameters: params).query}';
    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      checkInClientsList = [];

      checkInClientsList = checkInFromJson(response.body);

      return checkInClientsList;
    } else {
      return null;
    }
  }
}
