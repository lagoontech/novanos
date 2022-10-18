import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/constants.dart';

import '../dimensions.dart';
import 'subtitle_text.dart';

class VisitDataField extends StatelessWidget {
  const VisitDataField({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.acccentColor, width: 1),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: Dimensions.width90,
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10, vertical: Dimensions.height5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
              child: Text(
                title,
                maxLines: 3,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.backgroundColor),
              )),
          kWidth10,
          SizedBox(
              width: Dimensions.width160, child: SubTitleText(subTitle: value)),
        ],
      ),
    );
  }
}
