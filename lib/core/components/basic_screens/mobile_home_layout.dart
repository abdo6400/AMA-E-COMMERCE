import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_values.dart';
import '../default_components/default_appbar.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({super.key, required this.screens});
  final List<Map<String, dynamic>> screens;
// static final PersistentTabController controller =
//       PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      //controller: controller,
      context,
      screens: List<Widget>.from(screens.map((e) => SafeArea(
            child: Scaffold(
              appBar: DefaultAppBar(
                addLang: false,
                addLeadingButton: false,
                appBarText: e["title"].toString(),
                backgroundColor: AppColors.white,
                elevation: 0.5,
              ),
              body: e["screen"],
            ),
          ))),
      items: screens
          .map((e) => PersistentBottomNavBarItem(
              icon: Icon(e["icon"]),
              activeColorSecondary: AppColors.primary,
              activeColorPrimary: AppColors.white,
              inactiveColorSecondary: AppColors.grey,
              inactiveColorPrimary: AppColors.grey,
              iconSize: AppValues.font * 30))
          .toList(),
      backgroundColor: AppColors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      decoration: const NavBarDecoration(
        colorBehindNavBar: AppColors.white,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Set your desired shadow color here
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2), // This will cast the shadow only downwards
          ),
        ],
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
