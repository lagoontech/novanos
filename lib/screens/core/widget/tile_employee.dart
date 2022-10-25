import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:novanas/models/employee.dart';
import 'package:novanas/screens/admin/pages/widgets/employee_details.dart';
import 'package:novanas/screens/core/constants.dart';
import '../colors.dart';
import '../dimensions.dart';

class TileEmployee extends StatelessWidget {
  const TileEmployee({
    Key? key,
    required this.employee,
  }) : super(key: key);

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height10, horizontal: Dimensions.width10),
      decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10 / 2)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Dimensions.width160,
                child: Text(
                  employee.name ?? 'NA',
                  style: TextStyle(
                      fontSize: Dimensions.fontSize20,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.backgroundColor),
                ),
              ),
              Text(
                employee.designationName ?? 'NA',
                style: TextStyle(
                    fontSize: Dimensions.fontSize12,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.backgroundColor),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => EmployeeDetails(
                  employee: employee,
                )),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.arrow_right,
                    color: AppColors.backgroundColor,
                    size: Dimensions.fontSize28,
                  ),
                  kWidth10,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
