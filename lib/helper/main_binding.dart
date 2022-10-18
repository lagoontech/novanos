import 'package:get/get.dart';
import 'package:novanas/services/controllers/client_controller.dart';

import '../services/controllers/login_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<ClientController>(ClientController());
  }
}