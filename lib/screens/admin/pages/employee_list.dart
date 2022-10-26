import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/controllers/admin_controller.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/dimensions.dart';
import '../../core/widget/tile_employee.dart';
import '../../core/widget/title_page.dart';

// ignore: must_be_immutable
class AdminEmployeeList extends StatefulWidget {
  const AdminEmployeeList({Key? key}) : super(key: key);

  @override
  State<AdminEmployeeList> createState() => _AdminEmployeeListState();
}

class _AdminEmployeeListState extends State<AdminEmployeeList> {
  AdminController adminController = Get.find();

  TextEditingController searchController = TextEditingController();

  final _foundEmployee = [].obs;

  var employeeList = [].obs;

  @override
  void initState() {
    employeeList.value = adminController.employeeList.obs;
    _foundEmployee.value = employeeList;

    setState(() {});

    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    var results = [].obs;
    if (enteredKeyword.isEmpty) {
      results = employeeList;
    } else {
      results.value = employeeList.where((employee) {
        return employee.name.toLowerCase().contains(enteredKeyword);
      }).toList();
    }
    _foundEmployee.value = results;
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
                const TitlePage(title: 'Employee list'),
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
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TileEmployee(
                      employee: _foundEmployee[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kHeight10;
                  },
                  itemCount: _foundEmployee.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
