import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/main_screen.dart';
import 'package:novanas/services/controllers/login_controller.dart';

import '../core/widget/title_page.dart';

class LoginScreen extends StatelessWidget {
  var isChecked = false;

  LoginScreen({Key? key}) : super(key: key);
  LoginController loginController = Get.find();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.height10, horizontal: Dimensions.width30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const TitlePage(title: 'Sign In'),
              Image.asset(
                'assets/images/company_logo.png',
                width: 200,
                height: 200,
              ),
              kHeight30,
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Username cannot be blank' : null,
                controller: userNameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
              ),
              kHeight30,
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Password cannot be blank' : null,
                controller: passWordController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
              ),
              kHeight20,
              Row(
                children: [
                  Checkbox(value: isChecked, onChanged: (value) {}),
                  Text(
                    'Remember Me',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  const Spacer(),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.acccentColor),
                  ),
                ],
              ),
              kHeight20,
              Container(
                width: double.infinity,
                height: Dimensions.height50 + Dimensions.height10,
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool isLoggedIn =
                          await loginController.loginWithUserDetails(
                              userName: userNameController.text,
                              passWord: passWordController.text);
                      if (isLoggedIn) {
                        Get.off(() => const MainScreen());
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
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
