import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_sizes.dart';
import '../../../home/presentation/view/home_view.dart';
import '../../../profile/presentation/view/profile_view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    const HomeView(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellowAccent,
    ),
     const ProfileView(),
  ];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.home,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.category,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.calender,
        ),
      ),
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
      iconSize: ManagerRadius.r26,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerAssets.profile,
        ),
      ),
      iconSize: ManagerRadius.r26,
      activeColorPrimary: ManagerColors.primaryColor,
      inactiveColorPrimary: ManagerColors.black,
    ),
  ];
}
