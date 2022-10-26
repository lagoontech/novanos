import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/constants.dart';

import '../dimensions.dart';
import 'subtitle_text.dart';

class DoubleTextContainer extends StatelessWidget {
  const DoubleTextContainer({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);

  final String leftText;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.height50 + Dimensions.height10,
          width: Dimensions.width160 + Dimensions.width20,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.height10,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.acccentColor, width: 1),
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: Dimensions.width160,
                  child: Text(
                    leftText,
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: Dimensions.fontSize12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.acccentColor),
                  )),
            ],
          ),
        ),
        kWidth10,
        Container(
            height: Dimensions.height50 + Dimensions.height10,
            width: Dimensions.width90,
            padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.acccentColor, width: 1),
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
            child: Center(
              child: SubTitleText(
                subTitle: rightText,
              ),
            ))
      ],
    );
  }
}
