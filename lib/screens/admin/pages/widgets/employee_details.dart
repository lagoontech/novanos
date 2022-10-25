import 'package:flutter/material.dart';
import 'package:novanas/models/employee.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/date_service.dart';
import '../../../core/colors.dart';
import '../../../core/dimensions.dart';
import '../../../core/widget/normal_title_value_field.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key, required this.employee}) : super(key: key);
  final Employee employee;

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
          horizontal: Dimensions.width20,
          vertical: Dimensions.height10,
        ),
        child: ListView(
          children: [
            const TitlePage(title: 'Employee details'),
            NormalTitleValueField(
              title: 'NAME',
              value: employee.name ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'DESIGNATION',
              value: employee.designationName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'DEPARTMENT',
              value: employee.departmentName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'BRANCH NAME',
              value: employee.branchName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'EMAIL',
              value: employee.email ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'COMPANY NAME',
              value: employee.companyName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'GENDER',
              value: employee.gender == 'M' ? 'MALE' : 'FEMALE',
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'DOB',
              value: DateService.getFormatedhypenDate(employee.dateofBirth!) ??
                  "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'SHIFT NAME',
              value: employee.shiftName.toString(),
            ),
          ],
        ),
      )),
    );
  }
}
