import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';

import '../colors.dart';
import '../dimensions.dart';

class TileClientSummary extends StatelessWidget {
  const TileClientSummary({
    Key? key,
    required this.name,
    required this.address,
    required this.checkIn,
    required this.checkOut,
    required this.checkDay,
  }) : super(key: key);

  final String name;
  final String address;
  final String checkIn;
  final String checkOut;
  final String checkDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
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
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.calendar,
                  color: AppColors.backgroundColor,
                  size: Dimensions.fontSize28,
                ),
                kWidth10,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.width90,
                      child: Text(
                        checkDay,
                        maxLines: 3,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.fontSize12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundColor),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width90,
                      child: Text(
                        'In - $checkIn',
                        maxLines: 3,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.fontSize12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundColor),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width90,
                      child: Text(
                        'Out - $checkOut',
                        maxLines: 3,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.fontSize12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.backgroundColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
