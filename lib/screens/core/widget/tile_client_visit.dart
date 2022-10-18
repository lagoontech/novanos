import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/constants.dart';

import '../../client/visit_client.dart';
import '../colors.dart';
import '../dimensions.dart';

class TileClientVisit extends StatelessWidget {
  const TileClientVisit({
    Key? key,
    required this.name,
    required this.address,
  }) : super(key: key);

  final String name;
  final String address;

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
                  name,
                  style: TextStyle(
                      fontSize: Dimensions.fontSize20,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.backgroundColor),
                ),
              ),
              Text(
                address,
                style: TextStyle(
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundColor),
              ),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.acccentColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
            child: TextButton(
              onPressed: () {
                Get.to(() => VisitClient());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_alert,
                    color: AppColors.backgroundColor,
                  ),
                  kWidth10,
                  Text(
                    'VISIT',
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
