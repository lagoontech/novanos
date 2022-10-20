import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:novanas/models/client.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/controllers/client_controller.dart';
import 'package:novanas/services/controllers/login_controller.dart';
import 'package:novanas/services/date_service.dart';
import '../core/colors.dart';
import '../core/widget/visit_data_field.dart';

class ScheduleVisitClient extends StatelessWidget {
  final Client client;
  ScheduleVisitClient({Key? key, required this.client}) : super(key: key);

  TextEditingController commentController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ClientController clientController = Get.find();
  LoginController loginController = Get.find();

  DateTime? estimatedDateValue;

  Future<void> _selectDate(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final DateTime? d = await showDatePicker(
      //we wait for the dialog to return
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.acccentColor, // <-- SEE HERE
              onPrimary: AppColors.backgroundColor, // <-- SEE HERE
              onSurface: AppColors.acccentColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.acccentColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    dateController.text = DateFormat.yMd().format(d!);
    estimatedDateValue = d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.acccentColor,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const TitlePage(title: 'Visit Client'),
              VisitDataField(
                  title: 'Customer Name',
                  value: client.customerName ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Contact Person',
                  value: client.contactPerson ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Designation',
                  value: client.designation ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Location', value: client.location ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Product', value: client.product ?? "Not avaiable"),
              kHeight20,
              TextFormField(
                controller: dateController,
                validator: (value) => value!.isEmpty
                    ? 'Estimated Date of Visit cannot be blank'
                    : null,
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Estimated Date of Visit',
                  prefixIcon: Icon(
                    CupertinoIcons.calendar,
                    color: AppColors.acccentColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
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
              kHeight30,
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
                        await clientController.checkVisit(
                          checkComment: commentController.text,
                          client: client,
                          checkStatus: 'IN',
                        );
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Schedule Visit",
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: Dimensions.fontSize18),
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
