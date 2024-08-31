import 'package:flutter/material.dart';

import '../../../../core/components/basic_components/authentication_checker_component.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationCheckerComponent(child: Container());
  }
}
