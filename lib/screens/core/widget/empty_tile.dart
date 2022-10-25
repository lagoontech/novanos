import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';

import '../dimensions.dart';
import 'subtitle_text.dart';

class EmptyTile extends StatelessWidget {
  const EmptyTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50 + Dimensions.height10,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.acccentColor, width: 1),
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
        children: [
          SizedBox(
              width: Dimensions.width160,
              child: SubTitleText(subTitle: 'No $text data')),
        ],
      ),
    );
  }
}
