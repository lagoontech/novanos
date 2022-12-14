import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/services/controllers/client_controller.dart';

import '../services/auth_service.dart';
import '../services/controllers/summary_conrtoller.dart';
import '../services/location_services.dart';
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
        SummaryController summaryController = Get.find();
        await summaryController.getSummaryReport();
        await clientController.getClientList();
        await LocationService().getCurrentPosition();
        Get.off(() => const MainScreen(), transition: Transition.cupertino);
      } else {
        await AuthService().clearSharedPref();
        await LocationService().getCurrentPosition();
        Get.off(() => LoginScreen());
      }
    });
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/app_logo.jpg',
              width: 200,
              height: 200,
            ),
          ),
          const Spacer(),
          LoadingAnimationWidget.fallingDot(
            color: AppColors.acccentColor,
            size: 50,
          ),
          kHeight30,
          kHeight30,
        ],
      ),
    );
  }
}
