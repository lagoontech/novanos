import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/schedule_request.dart';
import 'package:novanas/screens/core/constants.dart';
import '../../admin/pages/widgets/schedule_request_detail.dart';
import '../colors.dart';
import '../dimensions.dart';

class TileScheduleRequest extends StatelessWidget {
  const TileScheduleRequest({
    Key? key,
    required this.scheduleRequest,
  }) : super(key: key);

  final ScheduleRequest scheduleRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height20, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Text(
                  scheduleRequest.employeeName ?? 'NA',
                  style: TextStyle(
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.backgroundColor),
                ),
              ),
              kWidth20,
              Icon(
                Icons.next_week,
                color: AppColors.acccentColor,
              ),
              kWidth20,
              Text(
                scheduleRequest.customerName ?? 'NA',
                style: TextStyle(
                    fontSize: Dimensions.fontSize18,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundColor),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(() => ScheduleRequestDetail(
                    scheduleRequest: scheduleRequest,
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10, vertical: Dimensions.height5),
              decoration: BoxDecoration(
                  color: AppColors.acccentColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
              child: Icon(
                CupertinoIcons.arrow_right,
                color: AppColors.backgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
