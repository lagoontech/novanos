import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/client.dart';
import 'package:novanas/screens/client/visit_client.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import '../client/check_out_client.dart';
import '../core/colors.dart';
import '../core/widget/tile_check_in_out.dart';
import '../core/widget/tile_next_tile.dart';
import '../core/widget/title_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  checkIn(Client client) {
    Get.to(() => VisitClient(
          client: client,
        ));
  }

  checkOut() {
    Get.to(() => const CheckOutClient());
  }

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
                TileCheckInOut(
                    name: 'MNC HOSPITAL',
                    address: 'Deira, Dubai',
                    status: 'Check-OUT',
                    checkFunc: () {
                      checkOut();
                    })
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
                      "Todays Client",
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
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TileCheckInOut(
                        name: 'MNC HOSPITAL',
                        address: 'Deira, Dubai',
                        status: 'VISIT',
                        checkFunc: () {
                          checkOut();
                        },
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
