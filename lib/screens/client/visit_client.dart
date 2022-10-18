import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/profile_data_field.dart';

import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/screens/main_screen.dart';

import '../auth/login_screen.dart';
import '../core/colors.dart';
import '../core/widget/visit_data_field.dart';

class VisitClient extends StatelessWidget {
  const VisitClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.acccentColor,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: ListView(
          children: [
            const TitlePage(title: 'Visit Client'),
            const VisitDataField(title: 'Customer Name', value: 'MNC HOSPITAL'),
            kHeight20,
            const VisitDataField(title: 'Contact Person', value: 'Nadir'),
            kHeight20,
            const VisitDataField(title: 'Designation', value: 'Sales'),
            kHeight20,
            const VisitDataField(title: 'Location', value: 'Deira'),
            kHeight20,
            const VisitDataField(title: 'Product', value: 'Syrup'),
            kHeight20,
            const VisitDataField(
                title: 'Esitmated Date of visit',
                value: '12:00 PM | 22-OCT-2022'),
            kHeight20,
            const VisitDataField(title: 'Lead Source', value: 'Instagram'),
            kHeight20,
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.acccentColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: Dimensions.height10),
                hintStyle: TextStyle(color: AppColors.acccentColor),
                hintText: 'Comment',
                prefixIcon: Icon(
                  CupertinoIcons.sort_up_circle,
                  color: AppColors.acccentColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.acccentColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
              ),
            ),
            kHeight30,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.acccentColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check In",
                      style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: Dimensions.fontSize18),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
