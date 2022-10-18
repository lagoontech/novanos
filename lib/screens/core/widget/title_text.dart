import 'package:flutter/material.dart';

import '../colors.dart';
import '../dimensions.dart';

class TextTitle extends StatelessWidget {
  TextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: Dimensions.fontSize20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    );
  }
}
