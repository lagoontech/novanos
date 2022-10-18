import 'package:flutter/material.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import '../core/colors.dart';
import '../core/widget/tile_check_in_out.dart';
import '../core/widget/tile_next_tile.dart';
import '../core/widget/title_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20, vertical: Dimensions.height10),
        child: ListView(
          children: [
            const TitlePage(
              title: 'Dashboard',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current CheckIn',
                  maxLines: 2,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.acccentColor),
                ),
                kHeight10,
                const TileCheckInOut(
                  name: 'MNC HOSPITAL',
                  address: 'Deira, Dubai',
                  Status: 'Check-Out',
                )
              ],
            ),
            kHeight30,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next Client',
                      maxLines: 2,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: Dimensions.fontSize18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.acccentColor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.more_horiz,
                              color: AppColors.acccentColor,
                            ),
                            kWidth10,
                            SubTitleText(
                              subTitle: 'More',
                            ),
                          ],
                        ))
                  ],
                ),
                kHeight10,
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const NextClient(
                        name: 'MNC HOSPITAL',
                        address: 'Deira, Dubai',
                        Status: 'Check-Out',
                        checkDay: 'Today',
                        checkTime: '12.00 PM',
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: 5)
              ],
            )
          ],
        ),
      ),
    );
  }
}
