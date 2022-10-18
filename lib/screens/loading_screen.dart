import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:novanas/services/controllers/client_controller.dart';

import '../services/auth_service.dart';
import 'auth/login_screen.dart';
import 'main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      var islogin = await AuthService().getAuthentication();
      if (islogin) {
        ClientController clientController = Get.find();

        await clientController.getClientList();
        Get.off(() => const MainScreen());
      } else {
        Get.off(() => LoginScreen());
      }
    });
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/images/company_logo.png',
        width: 200,
        height: 200,
      ),
    ));
  }
}
