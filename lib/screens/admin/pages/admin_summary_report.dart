import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/core/widget/tile_client_summary.dart';
import 'package:novanas/services/controllers/summary_conrtoller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/title_page.dart';

// ignore: must_be_immutable
class AdminSummaryReport extends StatefulWidget {
  const AdminSummaryReport({Key? key}) : super(key: key);

  @override
  State<AdminSummaryReport> createState() => _AdminSummaryReportState();
}

class _AdminSummaryReportState extends State<AdminSummaryReport> {
  SummaryController summaryController = Get.find();

  TextEditingController searchController = TextEditingController();

  final _foundSummaryReport = [].obs;

  var sumaryReportList = [].obs;

  @override
  void initState() {
    sumaryReportList.value = summaryController.summaryReportList.obs;
    _foundSummaryReport.value = sumaryReportList;

    setState(() {});

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results = [].obs;
    if (enteredKeyword.isEmpty) {
      results = sumaryReportList;
    } else {
      results.value = sumaryReportList.where((employee) {
        return employee.name.toLowerCase().contains(enteredKeyword);
      }).toList();
    }
    _foundSummaryReport.value = results;
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
              horizontal: Dimensions.width20,
              vertical: Dimensions.height10,
            ),
            child: Obx(
              () => ListView(
                children: [
                  const TitlePage(title: 'Summary report'),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    onChanged: (value) {
                      _runFilter(value.toLowerCase());
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.acccentColor),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
                      ),
                    ),
                  ),
                  kHeight20,
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TileClientSummary(
                        summaryReport: _foundSummaryReport[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: _foundSummaryReport.length,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
