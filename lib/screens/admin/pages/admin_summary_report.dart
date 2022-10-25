import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/summary_report.dart';
import 'package:novanas/screens/core/widget/tile_client_summary.dart';
import 'package:novanas/services/controllers/summary_conrtoller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/title_page.dart';

// ignore: must_be_immutable
class AdminSummaryReport extends StatelessWidget {
  AdminSummaryReport({Key? key}) : super(key: key);

  SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<SummaryReport> summaryReportList = summaryController.summaryReportList;
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
              const TitlePage(title: 'Summary report'),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TileClientSummary(
                    summaryReport: summaryReportList[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return kHeight10;
                },
                itemCount: summaryReportList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
