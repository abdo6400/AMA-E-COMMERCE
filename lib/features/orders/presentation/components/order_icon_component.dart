import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_values.dart';

class OrderIconComponent extends StatelessWidget {
  const OrderIconComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Badge.count(
          count: 0,
          child: Icon(
            Icons.shopping_basket_outlined,
            color: Theme.of(context).primaryColor,
            size: AppValues.font * 28,
          )),
      onPressed: () => context.navigateTo(screenRoute: Routes.orderRoute),
    );
  }
}
