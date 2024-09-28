import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../features/orders/presentation/components/order_icon_component.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';

class AppbarComponents extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppbarComponents({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      elevation: 2,
      leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.sort)),
      actions: [
        SizedBox(
          width: AppValues.sizeWidth * 10,
        ),
        IconButton(
          icon: Badge.count(
              count: 0,
              child: const Icon(
                Icons.notifications_active_outlined,
              )),
          onPressed: () {},
        ),
        SizedBox(
          width: AppValues.sizeWidth * 10,
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(Icons.shopify,
          //     color: Theme.of(context).colorScheme.secondary,
          //     size: AppValues.font * 20),
          // SizedBox(
          //   width: AppValues.sizeWidth * 5,
          // ),
          Text(
            title.tr(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          padding: EdgeInsets.all(AppValues.radius * 10),
          child: Row(
            children: [
              const OrderIconComponent(),
              SizedBox(
                width: AppValues.sizeWidth * 5,
              ),
              Expanded(
                child: SearchBar(
                  trailing: const [
                    Icon(Icons.search),
                  ],
                  hintText: AppStrings.searchForProducts.tr(context),
                  elevation: WidgetStateProperty.all(0.5),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppValues.radius * 10)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
