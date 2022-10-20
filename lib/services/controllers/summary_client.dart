import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novanas/models/summary_report.dart';
import 'package:novanas/services/date_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../api_urls.dart';

class SummaryController extends GetxController {
  List<SummaryReport> summaryReportList = [];

  @override
  void onInit() async {
    await getSummaryReport();
    super.onInit();
  }

  Future<List<SummaryReport>?> getSummaryReport() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String employeeNo = sharedPreferences.getString('username')!;
    print(employeeNo);
    var now = DateTime.now();

// Find the last day of the month.
    var beginningPastMonth = (now.month < 12)
        ? DateTime(now.year, now.month - 1, 1)
        : DateTime(now.year - 1, 1, 1);

    Map<String, dynamic> params = {
      'FromDate': DateService.getFormatedhypenDate(beginningPastMonth),
      'EndDate': DateService.getFormatedhypenDate(DateTime.now()).toString(),
      'EmployeeNo': employeeNo,
    };

    String url =
        '${URL.SUMMARY_REPORT_LIST}${Uri(queryParameters: params).query}';

    Http.Response _response =
        await Http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (_response.statusCode == 200) {
      summaryReportList = [];

      summaryReportList = summaryReportFromJson(_response.body);

      return summaryReportList;
    } else {
      return null;
    }
  }
}
