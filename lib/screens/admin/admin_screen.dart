import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/admin_services.dart';
import '../core/widget/admin_feature_tile.dart';
import 'pages/admin_summary_report.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitlePage(title: 'Admin'),
              AdminTile(
                featureTitleText: 'Employee list',
                icon: Icons.list_alt,
                function: () => AdminService().employeeListFunction(),
              ),
              AdminTile(
                featureTitleText: 'Schedule request',
                icon: Icons.schedule_send_outlined,
                function: () => AdminService().scheduleRequestFunction(),
              ),
              AdminTile(
                featureTitleText: 'Summary report',
                icon: Icons.history,
                function: () => Get.to(() => const AdminSummaryReport()),
              ),
              kHeight20,
            ],
          ),
        ),
      ),
    );
  }
}
