import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:raabta/controller/ui_controller.dart';

class MyNav extends StatefulWidget {
  const MyNav({
    super.key,
  });

  @override
  State<MyNav> createState() => _MyNavState();
}

class _MyNavState extends State<MyNav> with TickerProviderStateMixin {
  static MotionTabBarController? motionTabBarController;
  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UIcontroller>(
      builder: (context, value, child) {
        // motionTabBarController ??= MotionTabBarController(
        //   initialIndex: value.currentIndex,
        //   length: 3,
        //   vsync: this,
        // );
        if (motionTabBarController != null) {
          log('controller index${motionTabBarController!.index.toString()}');
          log('current index${value.currentIndex}');
          // Ensure the index is set only if motionTabBarController is not null
          if (motionTabBarController!.index != value.currentIndex) {
            log('Idher Ao');
            motionTabBarController!.index = value.currentIndex;
          }
        }
        return MotionTabBar(
          controller: motionTabBarController,
          labels: const [
            "Dashboard",
            "Challan Verfication",
            "License Verification"
          ],
          icons: const [Icons.dashboard, Icons.token, Icons.car_crash],
          initialSelectedTab: "Dashboard",
          // selectedIndex: value.currentIndex,

          // gap: 6,
          // activeColor: Colors.white,
          // tabBackgroundColor: context.read<ThemeProvider>().isdark
          // ? AppColor.greycolor
          // : const Color.fromARGB(255, 192, 133, 215),

          // currentIndex: value.currentIndex,
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.green,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.green.shade900,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.green.shade100,
          onTabItemSelected: (int index) {
            // _tabController!.index = value;
            if (mounted) {
              value.changeindex(index);
              motionTabBarController!.index = index;
              value.pageController.jumpToPage(index);
              log('tab ${value.currentIndex.toString()}');
            }
          },

          // padding: const EdgeInsets.all(10),
        );
        // if (motionTabBarController != null) {
        //   motionTabBarController!.index = value.currentIndex;
        // }
      },
      // child:
    );
  }
}
