import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/controllers/client_controller.dart';
import 'package:novanas/services/controllers/login_controller.dart';
import '../../../models/checkin.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/visit_data_field.dart';

// ignore: must_be_immutable
class CheckOutClient extends StatelessWidget {
  final CheckIn checkOutClient;
  CheckOutClient({Key? key, required this.checkOutClient}) : super(key: key);

  TextEditingController commentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginController loginController = Get.find();
  ClientController clientController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.acccentColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const TitlePage(title: 'Check Out'),
              VisitDataField(
                  title: 'Customer Name',
                  value: checkOutClient.customerName ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Contact Person',
                  value: checkOutClient.contactPerson ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                title: 'Designation',
                value: checkOutClient.designation ?? "Not avaiable",
              ),
              kHeight20,
              VisitDataField(
                title: 'Location',
                value: checkOutClient.location ?? "Not avaiable",
              ),
              kHeight20,
              VisitDataField(
                title: 'Lead Source',
                value: checkOutClient.leadSource ?? "Not avaiable",
              ),
              kHeight20,
              TextFormField(
                validator: (value) =>
                    value!.isEmpty ? 'Comment cannot be blank' : null,
                controller: commentController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Comment *',
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
              kHeight20,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.acccentColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 / 2)),
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool employeeAuthenticate =
                          await loginController.authenticate();
                      if (employeeAuthenticate) {
                        await clientController.checkOutVisit(
                          checkComment: commentController.text,
                          checkInClient: checkOutClient,
                          checkStatus: 'OUT',
                        );
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CHECK-OUT",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: Dimensions.fontSize18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kHeight30,
            ],
          ),
        ),
      ),
    );
  }
}
