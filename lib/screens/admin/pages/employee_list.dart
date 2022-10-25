import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/employee.dart';
import '../../../services/controllers/admin_controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/tile_employee.dart';
import '../../core/widget/title_page.dart';

// ignore: must_be_immutable
class AdminEmployeeList extends StatelessWidget {
  AdminEmployeeList({Key? key}) : super(key: key);

  AdminController adminController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Employee> employeeList = adminController.employeeList;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Dimensions.height50,
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.acccentColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20,
            vertical: Dimensions.height10,
          ),
          child: ListView(
            children: [
              const TitlePage(title: 'Employee list'),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TileEmployee(
                    employee: employeeList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return kHeight10;
                },
                itemCount: employeeList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
