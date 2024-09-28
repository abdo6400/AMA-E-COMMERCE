import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartIconComponent extends StatelessWidget {
  final IconData icon;
  const CartIconComponent({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Badge.count(
        count: state.products.length,
        child: Icon(icon),
      );
    });
  }
}
