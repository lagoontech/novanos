import 'package:flutter/material.dart';
import 'package:novanas/models/summary_report.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import '../../../core/colors.dart';
import '../../../core/dimensions.dart';
import '../../../core/widget/normal_title_value_field.dart';

class SummaryReportDetails extends StatelessWidget {
  const SummaryReportDetails({Key? key, required this.summaryReport})
      : super(key: key);
  final SummaryReport summaryReport;

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
            const TitlePage(title: 'Summary details'),
            NormalTitleValueField(
              title: 'NAME',
              value: summaryReport.name ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'DESIGNATION',
              value: summaryReport.designationName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'DEPARTMENT',
              value: summaryReport.departmentName ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'TOTAL WORKHOURS',
              value: summaryReport.workHours ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKIN LOCATION',
              value: summaryReport.firstLocation ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKIN TIME',
              value: summaryReport.checkin ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKIN COMMENT',
              value: summaryReport.inComment ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKOUT LOCATION',
              value: summaryReport.lastLocation ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKOUT TIME',
              value: summaryReport.checckOut ?? "NA",
            ),
            kHeight20,
            NormalTitleValueField(
              title: 'CHECKOUT COMMENT',
              value: summaryReport.outComment ?? "NA",
            ),
          ],
        ),
      )),
    );
  }
}
