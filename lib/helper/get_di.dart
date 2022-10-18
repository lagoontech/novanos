import 'package:get/get.dart';
import 'package:novanas/services/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Get.put(
    () => sharedPreferences,
  );
  Get.lazyPut(
    () => Get.put(LoginController()),
  );
  // Get.put(
  //   () => Get.put(ProfileController()),
  // );
  // Get.put(
  //   () => Get.put(ProfileController()),
  // );
}
