import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';

import '../dimensions.dart';
import 'title_text.dart';

class AdminTile extends StatelessWidget {
  const AdminTile({
    Key? key,
    required this.featureTitleText,
    required this.function,
    required this.icon,
  }) : super(key: key);

  final String featureTitleText;
  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: GestureDetector(
        onTap: () async {
          await function();
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: Dimensions.width10,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
            boxShadow: [
              BoxShadow(
                blurStyle: BlurStyle.inner,
                color: AppColors.acccentColor,
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 35,
              ),
              TextTitle(title: featureTitleText),
            ],
          ),
        ),
      ),
    );
  }
}
