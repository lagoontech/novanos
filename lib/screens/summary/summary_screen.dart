import 'package:flutter/material.dart';
import 'package:novanas/screens/core/dimensions.dart';
import '../core/constants.dart';
import '../core/widget/tile_client_summary.dart';
import '../core/widget/title_page.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: ListView(
          children: [
            const TitlePage(
              title: 'Summary',
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const TileClientSummary(
                      name: 'XYZ HOSPITAL',
                      address: 'Sharjah, UAE',
                      checkIn: '12.00 PM',
                      checkOut: '1.30 PM',
                      checkDay: '22-OCT-22');
                },
                separatorBuilder: (context, index) {
                  return kHeight10;
                },
                itemCount: 3)
          ],
        ),
      ),
    );
  }
}
