import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';

class AppbarComponents extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const AppbarComponents({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(Icons.sort)),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
