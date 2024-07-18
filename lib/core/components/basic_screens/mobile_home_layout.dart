import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_values.dart';

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
            appBar: AppBar(
              leading: IconButton(
                icon: CircleAvatar(
                    backgroundColor: AppColors.grey.withOpacity(0.5),
                    child: const Icon(Icons.notifications)),
                onPressed: () {},
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.museum_outlined))
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(
                    AppStrings.location.tr(context),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: e["screen"],
          )))),
      items: screens
          .map((e) => PersistentBottomNavBarItem(
                icon: Icon(e["icon"]),
                title: e["title"].toString().tr(context),
                activeColorSecondary: AppColors.primary,
                activeColorPrimary: AppColors.primary,
                inactiveColorSecondary: AppColors.grey,
                inactiveColorPrimary: AppColors.grey,
                contentPadding: AppValues.paddingWidth * 5,
                inactiveIcon: Icon(e["iconBorder"]),
              ))
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
            color: Colors.grey,
            blurRadius: 10,
            spreadRadius: 0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
