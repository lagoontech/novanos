import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/client.dart';
import 'package:novanas/screens/client/schedule_visit.dart';
import 'package:novanas/screens/core/constants.dart';
import '../../../services/controllers/client_controller.dart';
import '../colors.dart';
import '../dimensions.dart';

class TileClientVisit extends StatelessWidget {
  TileClientVisit({
    Key? key,
    required this.client,
  }) : super(key: key);

  final Client client;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.width160,
                child: Text(
                  client.customerName ?? 'Not Available',
                  style: TextStyle(
                      fontSize: Dimensions.fontSize20,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.backgroundColor),
                ),
              ),
              Text(
                client.location ?? 'Not Available',
                style: TextStyle(
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundColor),
              ),
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.acccentColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
            child: TextButton(
              onPressed: () {
                Get.to(() => ScheduleVisitClient(
                      client: client,
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.clock_fill,
                    color: AppColors.backgroundColor,
                  ),
                  kWidth10,
                  Text(
                    'Schedule Visit',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimensions.fontSize16),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
