import 'package:flutter/material.dart';
import 'package:novanas/screens/core/dimensions.dart';

import '../colors.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.height30),
      child: Text(
        title,
        style: TextStyle(
            fontSize: Dimensions.fontSize28,
            fontWeight: FontWeight.w800,
            color: AppColors.secondaryColor),
      ),
    );
  }
}
