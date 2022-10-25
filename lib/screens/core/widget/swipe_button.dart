import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';

Widget swipeButton(Function swipeFunction) {
  return SwipingButton(
    iconColor: AppColors.backgroundColor,
    height: Dimensions.height50,
    backgroundColor: AppColors.acccentColor,
    swipeButtonColor: AppColors.primaryColor,
    text: "Check IN",
    onSwipeCallback: () async {
      swipeFunction();
    },
  );
}
