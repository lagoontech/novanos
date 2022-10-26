import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/colors.dart';
import 'package:novanas/screens/core/widget/schedule_request_tile.dart';
import 'package:novanas/screens/core/widget/title_page.dart';
import 'package:novanas/services/controllers/admin_controller.dart';

import '../../core/constants.dart';
import '../../core/dimensions.dart';

class AdminScheduleRequests extends StatefulWidget {
  const AdminScheduleRequests({Key? key}) : super(key: key);

  @override
  State<AdminScheduleRequests> createState() => _AdminScheduleRequestsState();
}

class _AdminScheduleRequestsState extends State<AdminScheduleRequests> {
  AdminController adminController = Get.find();

  TextEditingController searchController = TextEditingController();

  final _foundscheduleRequestList = [].obs;

  var scheduleRequestList = [].obs;

  @override
  void initState() {
    scheduleRequestList.value = adminController.scheduleRequestList;
    _foundscheduleRequestList.value = scheduleRequestList;

    setState(() {});

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results = [].obs;
    if (enteredKeyword.isEmpty) {
      results = scheduleRequestList;
    } else {
      results.value = scheduleRequestList.where((element) {
        return element.customerName.toLowerCase().contains(enteredKeyword);
      }).toList();
    }
    _foundscheduleRequestList.value = results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Dimensions.height50,
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.acccentColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitlePage(title: 'Schedule Request'),
              TextField(
                keyboardType: TextInputType.text,
                controller: searchController,
                onChanged: (value) {
                  _runFilter(value.toLowerCase());
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Dimensions.height10),
                  hintStyle: TextStyle(color: AppColors.acccentColor),
                  hintText: 'Search',
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.acccentColor,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.acccentColor),
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                  ),
                ),
              ),
              kHeight20,
              Obx(() => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TileScheduleRequest(
                        scheduleRequest: _foundscheduleRequestList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: _foundscheduleRequestList.length,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
