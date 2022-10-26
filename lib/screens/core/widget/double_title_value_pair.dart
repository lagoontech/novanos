import 'package:flutter/material.dart';

import '../colors.dart';
import '../dimensions.dart';

class DoubleTitleValuePair extends StatelessWidget {
  const DoubleTitleValuePair(
      {Key? key, required this.title, required this.value})
      : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: Dimensions.fontSize16,
            fontWeight: FontWeight.w700,
            color: AppColors.acccentColor,
          ),
        ),
        Text(
          value,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: Dimensions.fontSize16,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
