import 'package:flutter/material.dart';

import '../colors.dart';
import '../dimensions.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      maxLines: 2,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: Dimensions.fontSize12,
          fontWeight: FontWeight.w700,
          color: AppColors.acccentColor),
    );
  }
}
