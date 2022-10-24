import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/profile.dart';
import 'package:novanas/screens/auth/login_screen.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import 'package:novanas/services/controllers/login_controller.dart';
import 'package:novanas/services/date_service.dart';
import '../../services/auth_service.dart';
import '../core/colors.dart';
import '../core/widget/profile_data_field.dart';
import '../core/widget/title_page.dart';
import '../core/widget/title_text.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    Profile profile = loginController.profileDetails.first;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const TitlePage(
                title: 'Profile',
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurStyle: BlurStyle.inner,
                        color: AppColors.acccentColor,
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(4, 4), // changes position of shadow
                      ),
                    ],
                    color: AppColors.backgroundColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 / 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.acccentColor,
                      backgroundImage: NetworkImage(
                          profile.photo ?? 'assets/images/profile.jpg'),
                      maxRadius: 50,
                    ),
                    SizedBox(
                      width: Dimensions.width160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextTitle(
                            title: profile.firstName.toString(),
                          ),
                          SubTitleText(
                            subTitle: profile.designation.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kHeight20,
              ProfileDataField(
                title: 'Department',
                value: profile.department.toString(),
              ),
              kHeight20,
              ProfileDataField(
                title: 'Email',
                value: profile.email ?? 'Not Available',
              ),
              kHeight20,
              ProfileDataField(
                title: 'Phone',
                value: profile.phone == ''
                    ? 'Not Available'
                    : profile.phone ?? 'Not Available',
              ),
              kHeight20,
              ProfileDataField(
                title: 'DOB',
                value: DateService.getFormatedSlashDate(profile.dateofBirth!) ??
                    'Not Available',
              ),
              kHeight20,
              ProfileDataField(
                title: 'Martial Status',
                value: profile.maritalStatus == ''
                    ? 'Not Available'
                    : profile.maritalStatus ?? 'Not Available',
              ),
              kHeight30,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.acccentColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 / 2)),
                child: TextButton(
                  onPressed: () async {
                    AuthService().clearSharedPref();
                    await AuthService().saveAuthentication(false);
                    Get.off(() => LoginScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Logout",
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
      ),
    );
  }
}
