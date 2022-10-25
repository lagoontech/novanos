import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/models/next_visit.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/empty_tile.dart';
import '../../core/widget/tile_check_in_out.dart';
import '../pages/visit_client.dart';

class MorePendingClients extends StatelessWidget {
  const MorePendingClients({Key? key, required this.pendingClientsList})
      : super(key: key);
  final List<NextVisit> pendingClientsList;

  checkIn(NextVisit nextVisit) {
    Get.to(() => VisitClient(
          client: nextVisit,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.acccentColor,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: Dimensions.height50,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height30,
        ),
        child: SafeArea(
            child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return pendingClientsList.isEmpty
                ? const EmptyTile(
                    text: 'Pending',
                  )
                : TileCheckInOut(
                    name: pendingClientsList[index].customerName ??
                        'Not Available',
                    address:
                        pendingClientsList[index].location ?? 'Not Available',
                    status: 'VISIT',
                    checkFunc: () {
                      checkIn(pendingClientsList[index]);
                      // checkOut();
                    },
                  );
          },
          separatorBuilder: (context, index) {
            return kHeight10;
          },
          itemCount: pendingClientsList.isEmpty ? 1 : pendingClientsList.length,
        )),
      ),
    );
  }
}
