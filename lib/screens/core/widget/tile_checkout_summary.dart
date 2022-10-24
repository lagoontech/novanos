import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novanas/screens/core/constants.dart';
import 'package:novanas/screens/core/widget/subtitle_text.dart';
import 'package:novanas/services/date_service.dart';

import '../../../models/checkout_summary.dart';
import '../colors.dart';
import '../dimensions.dart';

class TileClientCheckOutSummary extends StatelessWidget {
  final CheckOutSummary checkOutClientSummary;
  const TileClientCheckOutSummary({
    Key? key,
    required this.checkOutClientSummary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            SizedBox(
              width: Dimensions.width160,
              child: Text(
                checkOutClientSummary.customerName ?? 'Not available',
                style: TextStyle(
                    fontSize: Dimensions.fontSize20,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundColor),
              ),
            ),
            Icon(
              CupertinoIcons.calendar,
              color: AppColors.backgroundColor,
              size: Dimensions.fontSize28,
            ),
            kWidth10,
            Row(
              children: [
                SizedBox(
                  child: Text(
                    'IN',
                    maxLines: 3,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: Dimensions.fontSize16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundColor),
                  ),
                ),
                kWidth10,
                SizedBox(
                  width: Dimensions.width90,
                  child: Text(
                    DateService.getFormatedhypenDate(
                            checkOutClientSummary.actualDateofVisit!) ??
                        'Not available',
                    maxLines: 3,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: Dimensions.fontSize12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.backgroundColor),
                  ),
                ),
              ],
            ),

            kHeight10,
            //   Row(
            //     children: [
            //       SizedBox(
            //         child: Text(
            //           'OUT ',
            //           maxLines: 3,
            //           style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               fontSize: Dimensions.fontSize16,
            //               fontWeight: FontWeight.w700,
            //               color: AppColors.backgroundColor),
            //         ),
            //       ),
            //       kWidth10,
            //       SizedBox(
            //         width: Dimensions.width90,
            //         child: Text(
            //           checkOut == '' ? 'NA' : checkOut,
            //           maxLines: 3,
            //           style: TextStyle(
            //               overflow: TextOverflow.ellipsis,
            //               fontSize: Dimensions.fontSize12,
            //               fontWeight: FontWeight.w700,
            //               color: AppColors.backgroundColor),
            //         ),
            //       ),
            //     ],
            //   ),
            // ],
          ]),
          SizedBox(
            width: Dimensions.width160,
            child: Text(
              checkOutClientSummary.checkTimeLocation ?? 'Not available',
              maxLines: 2,
              style: TextStyle(
                  fontSize: Dimensions.fontSize12,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.backgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
