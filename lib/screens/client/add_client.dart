import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:novanas/models/leadsource.dart';
import 'package:novanas/models/product.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/controllers/client_controller.dart';
import '../core/colors.dart';

// ignore: must_be_immutable
class AddClient extends StatefulWidget {
  AddClient({Key? key}) : super(key: key);

  String? selectedProduct;
  String? selectedLeadSource;

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactPersonController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime? estimatedDateValue;

  Future<void> addClientFunc() async {
    if (_formKey.currentState!.validate()) {
      if (widget.selectedProduct == null || widget.selectedLeadSource == null) {
        Get.snackbar('Select Fields', 'From the List');
      } else {
        Map<String, dynamic> dataBody = {
          "CustomerName": nameController.text,
          "ContactPerson": contactPersonController.text,
          "Designation": designationController.text,
          "Location": locationController.text,
          "Product": widget.selectedProduct,
          "EstimatedDateofVisit": estimatedDateValue.toString(),
          "ActualDateofVisit": estimatedDateValue.toString(),
          "LeadSource": widget.selectedLeadSource.toString(),
        };

        await clientController.insertClient(dataBody);
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
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

  ClientController clientController = Get.find();

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
        toolbarHeight: Dimensions.height50,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const TitlePage(title: 'Add Client'),
              TextFormField(
                controller: nameController,
                validator: (value) =>
                    value!.isEmpty ? 'Customer Name cannot be blank' : null,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Customer Name',
                  prefixIcon: Icon(
                    CupertinoIcons.text_aligncenter,
                    color: AppColors.acccentColor,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
              ),
              kHeight20,
              TextFormField(
                controller: contactPersonController,
                validator: (value) =>
                    value!.isEmpty ? 'Contact Person cannot be blank' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Contact Person',
                  prefixIcon: Icon(
                    CupertinoIcons.person,
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
                controller: designationController,
                validator: (value) =>
                    value!.isEmpty ? 'Designation cannot be blank' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Designation',
                  prefixIcon: Icon(
                    Icons.work,
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
                controller: locationController,
                validator: (value) =>
                    value!.isEmpty ? 'Location cannot be blank' : null,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Location',
                  prefixIcon: Icon(
                    CupertinoIcons.location,
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
                      items: allProductNameList.map(
                        (String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!),
                          );
                        },
                      ).toList(),
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
              kHeight30,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.acccentColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10 / 2)),
                child: TextButton(
                  onPressed: () async {
                    setState(() {
                      addClientFunc();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ADD CLIENT",
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
