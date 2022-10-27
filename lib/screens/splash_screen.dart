import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/loading_screen.dart';
import '../services/auth_service.dart';
import '../services/location_services.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () async {
      var islogin = await AuthService().getAuthentication();
      if (islogin) {
        await LocationService().getCurrentPosition();
        Get.off(() => const LoadingScreen(), transition: Transition.cupertino);
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
