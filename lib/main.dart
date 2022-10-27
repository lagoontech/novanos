import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novanas/helper/main_binding.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/loading_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novanas/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leadoon',
      theme: ThemeData(
        backgroundColor: AppColors.backgroundColor,
        focusColor: AppColors.acccentColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        toggleableActiveColor: AppColors.acccentColor,
      ),
      home: const LoadingScreen(),
      initialBinding: MainBinding(),
    );
  }
}
