import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/schedule_request.dart';
import 'package:novanas/screens/admin/pages/schedule_requests.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/widget/double_title_value_pair.dart';
import 'package:novanas/services/controllers/admin_controller.dart';
import 'package:novanas/services/date_service.dart';

import '../../../core/colors.dart';
import '../../../core/dimensions.dart';
import '../../../core/widget/subtitle_text.dart';
import '../../../core/widget/title_text.dart';

// ignore: must_be_immutable
class ScheduleRequestDetail extends StatelessWidget {
  ScheduleRequestDetail({Key? key, required this.scheduleRequest})
      : super(key: key);

  final ScheduleRequest scheduleRequest;

  AdminController adminController = Get.find();

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
              kHeight30,
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: AppColors.acccentColor,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.acccentColor,
                      backgroundImage: NetworkImage(
                          scale: 30.0,
                          scheduleRequest.employeeProfile ??
                              'assets/images/profile.jpg'),
                      maxRadius: 55,
                    ),
                    SizedBox(
                      width: Dimensions.width160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextTitle(
                            title: scheduleRequest.employeeName.toString(),
                          ),
                          SubTitleText(
                            subTitle: scheduleRequest.designation.toString(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kHeight20,
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                    vertical: Dimensions.height30),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: AppColors.acccentColor,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(4, 4), // changes position of shadow
                    ),
                  ],
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2),
                ),
                child: Column(
                  children: [
                    DoubleTitleValuePair(
                      title: 'Customer Name',
                      value: scheduleRequest.customerName ?? 'NA',
                    ),
                    kHeight10,
                    DoubleTitleValuePair(
                      title: 'Contact Person',
                      value: scheduleRequest.contactPerson ?? 'NA',
                    ),
                    kHeight10,
                    DoubleTitleValuePair(
                      title: 'Location',
                      value: scheduleRequest.location ?? 'NA',
                    ),
                    kHeight10,
                    DoubleTitleValuePair(
                      title: 'Estimated Date of Visit:',
                      value: DateService.getFormatedhypenDate(
                              scheduleRequest.estimatedDateOfVisit!)
                          .toString(),
                    ),
                    kHeight10,
                    DoubleTitleValuePair(
                      title: 'Product',
                      value: scheduleRequest.product ?? 'NA',
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  kHeight30,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.acccentColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 / 2)),
                    child: TextButton(
                      onPressed: () async {
                        await adminController.scheduleRequestApprove(
                            id: scheduleRequest.id.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "APPROVE",
                            style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: Dimensions.fontSize18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  kHeight30,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 / 2)),
                    child: TextButton(
                      onPressed: () async {
                        await adminController.scheduleRequestReject(
                            id: scheduleRequest.id.toString());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "REJECT",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: Dimensions.fontSize18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
