import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/cubits/manage_mobile_cubit/manage_mobile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';
import '../../../../features/cart/presentation/components/cart_icon_component.dart';

class TabviewComponent extends StatelessWidget {
  final List<Map<String, dynamic>> screens;

  const TabviewComponent({super.key, required this.screens});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: (int index) =>
          context.read<ManageMobileCubit>().changeCurrentPage(index),
      confineToSafeArea: false,
      screens: List<Widget>.from(screens.map(
        (e) => Scaffold(
          body: e["screen"],
        ),
      )),
      items: screens
          .map((e) => PersistentBottomNavBarItem(
                icon: e["title"].toString() == AppStrings.cart
                    ? CartIconComponent(icon: e["icon"])
                    : Icon(e["icon"]),
                title: e["title"].toString().tr(context),
                activeColorSecondary:
                    Theme.of(context).textTheme.bodyLarge!.color,
                activeColorPrimary: Theme.of(context).primaryColor,
                inactiveColorPrimary: Theme.of(context).hintColor,
                contentPadding: AppValues.paddingWidth * 2,
                inactiveIcon: e["title"].toString() == AppStrings.cart
                    ? CartIconComponent(icon: e["iconBorder"])
                    : Icon(e["iconBorder"]),
              ))
          .toList(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
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
