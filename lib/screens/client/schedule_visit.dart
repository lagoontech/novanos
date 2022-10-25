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
import '../../models/leadsource.dart';
import '../../models/product.dart';
import '../core/colors.dart';
import '../core/widget/visit_data_field.dart';

// ignore: must_be_immutable
class ScheduleVisitClient extends StatefulWidget {
  final Client client;
  ScheduleVisitClient({Key? key, required this.client}) : super(key: key);

  String? selectedProduct;
  String? selectedLeadSource;
  @override
  State<ScheduleVisitClient> createState() => _ScheduleVisitClientState();
}

class _ScheduleVisitClientState extends State<ScheduleVisitClient> {
  TextEditingController commentController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ClientController clientController = Get.find();

  LoginController loginController = Get.find();

  DateTime? estimatedDateValue;

  Future<void> addClientFunc() async {
    if (_formKey.currentState!.validate()) {
      if (estimatedDateValue == null) {
        Get.snackbar('Select Estimate', 'Date of Visit');
      } else {
        Map<String, dynamic> dataBody = {
          "CustomerId": widget.client.id,
          "CustomerName": widget.client.customerName,
          "ContactPerson": widget.client.customerName,
          "Designation": widget.client.designation,
          "Location": widget.client.location,
          "Product": widget.selectedProduct,
          "EstimatedDateofVisit": estimatedDateValue.toString(),
          "ActualDateofVisit": estimatedDateValue.toString(),
        };

        await clientController.scheduleClient(dataBody);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.acccentColor,
              onPrimary: AppColors.backgroundColor,
              onSurface: AppColors.acccentColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.acccentColor,
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
    List<Product>? allproductList = clientController.productList;
    List<String> allProductNameList = [];
    List<LeadSource>? allLeadsourceList = clientController.leadsourceList;
    List<String> allLeadSourceNameList = [];
    for (var element in allproductList) {
      String name = element.name ?? '';
      allProductNameList.add(name);
    }

    for (var element in allLeadsourceList) {
      String name = element.name ?? '';
      allLeadSourceNameList.add(name);
    }
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
              const TitlePage(title: 'Schedule Client'),
              VisitDataField(
                  title: 'Customer Name',
                  value: widget.client.customerName ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Contact Person',
                  value: widget.client.contactPerson ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                title: 'Designation',
                value: widget.client.designation ?? "Not avaiable",
              ),
              kHeight20,
              VisitDataField(
                  title: 'Location',
                  value: widget.client.location ?? "Not avaiable"),
              kHeight20,
              VisitDataField(
                  title: 'Product',
                  value: widget.client.product ?? "Not avaiable"),
              kHeight20,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    border: Border.all(color: AppColors.acccentColor)),
                child: Row(
                  children: [
                    Icon(
                      Icons.production_quantity_limits,
                      color: AppColors.acccentColor,
                    ),
                    kWidth20,
                    DropdownButton<String>(
                      onTap: () async {
                        await clientController.getProducts();
                      },
                      iconEnabledColor: AppColors.acccentColor,
                      focusColor: AppColors.backgroundColor,
                      hint: Text(
                        'Select The Product',
                        style: TextStyle(color: AppColors.acccentColor),
                      ),
                      value: widget.selectedProduct,
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.selectedProduct = newValue!;
                        });
                      },
                      items: allProductNameList.map((String? value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value!),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              kHeight20,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    border: Border.all(color: AppColors.acccentColor)),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.sort_up_circle,
                      color: AppColors.acccentColor,
                    ),
                    kWidth20,
                    DropdownButton<String>(
                      onTap: () async {
                        await clientController.getLeadSource();
                      },
                      iconEnabledColor: AppColors.acccentColor,
                      focusColor: AppColors.backgroundColor,
                      hint: Text(
                        'Select The Lead Source',
                        style: TextStyle(color: AppColors.acccentColor),
                      ),
                      value: widget.selectedLeadSource,
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.selectedLeadSource = newValue!;
                        });
                      },
                      items: allLeadSourceNameList.map((String? value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value!),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
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
                        // await clientController.checkVisit(
                        //   checkComment: commentController.text,
                        //   nextVisit: client,
                        //   checkStatus: 'IN',
                        // );
                        addClientFunc();
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
