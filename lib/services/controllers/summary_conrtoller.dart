import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:novanas/models/summary_report.dart';
import 'package:novanas/services/date_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/checkout_summary.dart';
import '../api_urls.dart';
import '../auth_service.dart';

class SummaryController extends GetxController {
  List<SummaryReport> summaryReportList = [];
  List<CheckOutSummary> checkOutSummaryList = [];

  @override
  void onInit() async {
    await getSummaryReport();
    await getCheckOutSummary();
    super.onInit();
  }

  Future<List<SummaryReport>?> getSummaryReport() async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> params = {
      'FromDate': DateService.getStartDateOfMonthhypenDate(),
      'EndDate': DateService.getFormatedhypenDate(DateTime.now()).toString(),
      'EmployeeNo': employeeNo,
    };

    String url =
        '${URL.summaryReportListUrl}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      summaryReportList = [];

      summaryReportList = summaryReportFromJson(response.body);

      return summaryReportList;
    } else {
      return null;
    }
  }

  Future<List<CheckOutSummary>?> getCheckOutSummary() async {
    String employeeNo = await AuthService().getEmpId();

    Map<String, dynamic> params = {
      'FromDate': DateService.getStartDateOfMonthhypenDate(),
      'EndDate': DateService.getFormatedhypenDate(DateTime.now()).toString(),
      'EmployeeNo': employeeNo,
    };

    String url = '${URL.checkOutListURL}${Uri(queryParameters: params).query}';

    http.Response response =
        await http.get(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      checkOutSummaryList = [];

      checkOutSummaryList = checkOutSummaryFromJson(response.body);

      return checkOutSummaryList;
    } else {
      return null;
    }
  }
}
