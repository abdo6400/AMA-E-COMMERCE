import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../utils/app_values.dart';

class TabviewComponent extends StatelessWidget {
  final List<Map<String, dynamic>> screens;
  const TabviewComponent({super.key, required this.screens});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      confineToSafeArea: false,
      screens: List<Widget>.from(screens.map(
        (e) => Scaffold(
          body: e["screen"],
        ),
      )),
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
      backgroundColor: Theme.of(context).cardColor,
      resizeToAvoidBottomInset: true,
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
