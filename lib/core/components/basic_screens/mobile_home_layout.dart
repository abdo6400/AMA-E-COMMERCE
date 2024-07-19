import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/app_values.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({super.key, required this.screens});
  final List<Map<String, dynamic>> screens;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: List<Widget>.from(screens.map((e) => FloatingDraggableWidget(
            floatingWidget: InkWell(
              onTap: () => context.navigateTo(screenRoute: Routes.amaChatRoute),
              child: const CircleAvatar(
                child: Icon(Icons.chat),
              ),
            ),
            floatingWidgetHeight: AppValues.sizeHeight * 60,
            floatingWidgetWidth: AppValues.sizeWidth * 60,
            autoAlign: true,
            screenHeight: AppValues.screenHeight,
            screenWidth: AppValues.screenWidth,
            dx: AppValues.screenWidth * 0.9,
            dy: AppValues.screenHeight * 0.5,
            mainScreenWidget: Scaffold(
              appBar: AppBar(
                leading:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
                actions: [
                  SizedBox(
                    width: AppValues.sizeWidth * 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 10,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_none_outlined),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 10,
                  ),
                ],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopify,
                        color: Theme.of(context).colorScheme.secondary,
                        size: AppValues.font * 20),
                    SizedBox(
                      width: AppValues.sizeWidth * 5,
                    ),
                    Text(
                      AppStrings.appName.tr(context).toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: e["screen"],
            ),
          ))),
      items: screens
          .map((e) => PersistentBottomNavBarItem(
                icon: Icon(e["icon"]),
                title: e["title"].toString().tr(context),
                activeColorSecondary:
                    Theme.of(context).textTheme.bodyLarge!.color,
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).hintColor,
                contentPadding: AppValues.paddingWidth * 5,
                inactiveIcon: Icon(e["iconBorder"]),
              ))
          .toList(),
      backgroundColor: Theme.of(context).cardColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Theme.of(context).cardColor,
        borderRadius: BorderRadius.zero,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
