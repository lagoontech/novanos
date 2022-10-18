import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/auth/login_screen.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/user.dart';
import '../../services/auth_service.dart';
import '../core/colors.dart';
import '../core/widget/profile_data_field.dart';
import '../core/widget/title_page.dart';
import '../core/widget/title_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileName = '';
  String profileCompany = '';
  String profileDepartment = '';
  String profileLocation = '';
  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    profileName = sharedPreferences.getString('name')!;
    profileDepartment = sharedPreferences.getString('departmentName')!;

    // profileCompany = user.companyName!;
    // profileDepartment = user.departmentName!;
    // profileLocation = user.location;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: ListView(
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
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.acccentColor,
                    backgroundImage:
                        const AssetImage('assets/images/profile.jpg'),
                    maxRadius: 50,
                  ),
                  SizedBox(
                    width: Dimensions.width160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTitle(
                          title: profileName,
                        ),
                        SubTitleText(
                          subTitle: profileDepartment,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            kHeight20,
            const ProfileDataField(
              title: 'Email',
              value: 'nadiraziziyah@gmail.com',
            ),
            kHeight20,
            const ProfileDataField(
              title: 'Phone',
              value: 'nadiraziziyah@gmail.com',
            ),
            kHeight20,
            const ProfileDataField(
              title: 'Address',
              value: 'Naif Souq, Deira, Dubai, United Arab Emirates',
            ),
            kHeight30,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.acccentColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
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
    );
  }
}
