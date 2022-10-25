import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/widget/title_page.dart';

import '../../core/dimensions.dart';

class AdminScheduleRequests extends StatelessWidget {
  const AdminScheduleRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Dimensions.height50,
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.acccentColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TitlePage(title: 'Schedule Request'),
            ],
          ),
        ),
      ),
    );
  }
}
