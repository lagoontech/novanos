import 'package:get/get.dart';
import 'package:novanas/services/controllers/admin_controller.dart';

import '../screens/admin/pages/employee_list.dart';

class AdminService {
  AdminController adminController = Get.find();
  employeeListFunction() async {
    await adminController.getEmployeeList();
    Get.to(() => AdminEmployeeList());
  }

  scheduleRequestFunction() {}
  summaryReportFunction() async {}
}
