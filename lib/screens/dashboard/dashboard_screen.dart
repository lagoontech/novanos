import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/next_visit.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/dimensions.dart';
import 'package:novanas/screens/core/widget/empty_tile.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import 'package:novanas/screens/dashboard/pages/check_out_client.dart';
import 'package:novanas/screens/dashboard/widgets/more_pending_clients.dart';
import 'package:novanas/services/controllers/dashboard_controller.dart';
import '../../models/checkin.dart';
import '../core/colors.dart';
import '../core/widget/tile_check_in_out.dart';
import '../core/widget/title_page.dart';
import 'pages/visit_client.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  DashBoardController dashBoardController = Get.find();

  checkIn(NextVisit nextVisit) {
    Get.to(() => VisitClient(
          client: nextVisit,
        ));
  }

  checkOut(CheckIn checkoutClient) {
    Get.to(() => CheckOutClient(checkOutClient: checkoutClient));
  }

  @override
  Widget build(BuildContext context) {
    List<NextVisit> nextVisitList = dashBoardController.nextClientsList;
    List<CheckIn> checkInClientsList = dashBoardController.checkInClientsList;

    int pendingLength = nextVisitList.length >= 5 ? 5 : nextVisitList.length;
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return checkInClientsList.isEmpty
                          ? const EmptyTile(
                              text: 'Check IN',
                            )
                          : TileCheckInOut(
                              name: checkInClientsList[index].customerName ??
                                  'Not Available',
                              address: checkInClientsList[index].location ??
                                  'Not Available',
                              status: 'CHECK-OUT',
                              checkFunc: () {
                                checkOut(checkInClientsList[index]);
                              },
                            );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: checkInClientsList.isEmpty
                        ? 1
                        : checkInClientsList.length,
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
                        "Pending Clients",
                        maxLines: 2,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.fontSize18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.acccentColor),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => MorePendingClients(
                                  pendingClientsList: nextVisitList,
                                ));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.more_horiz,
                                color: AppColors.acccentColor,
                              ),
                              kWidth10,
                              const SubTitleText(
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
                      return nextVisitList.isEmpty
                          ? const EmptyTile(
                              text: 'Pending',
                            )
                          : TileCheckInOut(
                              name: nextVisitList[index].customerName ??
                                  'Not Available',
                              address: nextVisitList[index].location ??
                                  'Not Available',
                              status: 'VISIT',
                              checkFunc: () {
                                checkIn(nextVisitList[index]);
                                // checkOut();
                              },
                            );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: pendingLength == 0 ? 1 : pendingLength,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
