import 'package:get/get.dart';
import 'package:novanas/screens/admin/pages/schedule_requests.dart';
import 'package:novanas/services/controllers/admin_controller.dart';

import '../screens/admin/pages/employee_list.dart';

class AdminService {
  AdminController adminController = Get.find();
  employeeListFunction() async {
    await adminController.getEmployeeList();
    await adminController.getScheduleRequests();
    Get.to(() => const AdminEmployeeList());
  }

  scheduleRequestFunction() async {
    await adminController.getScheduleRequests();
    Get.to(() => const AdminScheduleRequests());
  }

  summaryReportFunction() async {}
}
