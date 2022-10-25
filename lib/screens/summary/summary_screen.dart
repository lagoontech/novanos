import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/checkout_summary.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/services/controllers/summary_conrtoller.dart';
import '../core/constants.dart';
import '../core/widget/empty_tile.dart';
import '../core/widget/tile_checkout_summary.dart';
import '../core/widget/title_page.dart';

// ignore: must_be_immutable
class SummaryScreen extends StatelessWidget {
  SummaryScreen({Key? key}) : super(key: key);
  SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<CheckOutSummary> checkOutsummaryReportList =
        summaryController.checkOutSummaryList;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: ListView(
            children: [
              const TitlePage(
                title: 'Summary',
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return checkOutsummaryReportList.isEmpty
                      ? const EmptyTile(
                          text: 'Summary',
                        )
                      : TileClientCheckOutSummary(
                          checkOutClientSummary:
                              checkOutsummaryReportList[index],
                        );
                },
                separatorBuilder: (context, index) {
                  return kHeight10;
                },
                itemCount: checkOutsummaryReportList.isEmpty
                    ? 1
                    : checkOutsummaryReportList.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
