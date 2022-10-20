import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/summary_report.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/services/controllers/summary_client.dart';
import '../core/constants.dart';
import '../core/widget/tile_client_summary.dart';
import '../core/widget/title_page.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({Key? key}) : super(key: key);
  SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<SummaryReport> summaryReportList = summaryController.summaryReportList;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: ListView(
          children: [
            const TitlePage(
              title: 'Summary',
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return TileClientSummary(
                      name: summaryReportList[index].name!,
                      address: summaryReportList[index].lastLocation!,
                      checkIn: summaryReportList[index].checkin!,
                      checkOut: summaryReportList[index].checckOut!,
                      checkDay: '22-OCT-22');
                },
                separatorBuilder: (context, index) {
                  return kHeight10;
                },
                itemCount: summaryReportList.length)
          ],
        ),
      ),
    );
  }
}
