import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/basic_components/authentication_checker_component.dart';
import '../../../../core/utils/app_strings.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationCheckerComponent(child: Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.myOrders.tr(context)),
        centerTitle: true,
        elevation: 1,
      ),
    ));
  }
}
