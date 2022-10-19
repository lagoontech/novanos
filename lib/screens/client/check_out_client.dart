import 'package:flutter/material.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/widget/title_page.dart';

import '../core/dimensions.dart';

class CheckOutClient extends StatefulWidget {
  const CheckOutClient({Key? key}) : super(key: key);

  @override
  State<CheckOutClient> createState() => _CheckOutClientState();
}

class _CheckOutClientState extends State<CheckOutClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.acccentColor,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: ListView(
          children: [TitlePage(title: 'Check Out')],
        ),
      ),
    );
  }
}
