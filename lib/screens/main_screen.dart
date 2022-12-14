import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novanas/screens/admin/admin_screen.dart';
import 'package:novanas/screens/client/client_screen.dart';
import 'package:novanas/screens/dashboard/dashboard_screen.dart';
import 'package:novanas/screens/profile/profile_screen.dart';
import 'package:novanas/screens/summary/summary_screen.dart';
import 'package:novanas/services/controllers/client_controller.dart';
import 'package:novanas/services/controllers/dashboard_controller.dart';
import 'package:novanas/services/controllers/login_controller.dart';
import 'package:novanas/services/controllers/summary_conrtoller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../models/profile.dart';
import 'core/colors.dart';
import 'core/dimensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.screenIndex = 0}) : super(key: key);

  final int screenIndex;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState!.show());
    setState(() {});
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      DashboardScreen(),
      ClientScreen(),
      SummaryScreen(),
      ProfileScreen()
    ];
  }

  List<Widget> _adminBuildScreens() {
    return [
      const AdminScreen(),
      DashboardScreen(),
      ClientScreen(),
      SummaryScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_outlined),
        title: ("Dashboard"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_customize_rounded),
        title: ("Client"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.list_alt),
        title: ("Summary"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _adminNavBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.admin_panel_settings),
        title: ("Admin"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_outlined),
        title: ("Dashboard"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_customize_rounded),
        title: ("Client"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.list_alt),
        title: ("Summary"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: AppColors.acccentColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  refresh() {
    DashBoardController dashBoardController = Get.find();
    ClientController clientController = Get.find();
    SummaryController summaryController = Get.find();
    clientController.getClientList();
    summaryController.getSummaryReport();
    dashBoardController.getCheckInClients();
    dashBoardController.getNextClient();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    LoginController loginController = Get.find();
    Profile profile = loginController.profileDetails.first;

    controller = PersistentTabController(initialIndex: widget.screenIndex);

    return RefreshIndicator(
      key: _refreshIndicatorKey,
      color: AppColors.acccentColor,
      onRefresh: () async {
        refresh();
      },
      child: PersistentTabView(
        context,
        controller: controller,
        screens:
            profile.isAdmin == 'Y' ? _adminBuildScreens() : _buildScreens(),
        items: profile.isAdmin == 'Y' ? _adminNavBarsItems() : _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style11,
      ),
    );
  }
}
