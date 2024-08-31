import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/cart_product.dart';
import '../bloc/cart_bloc.dart';
import 'cart_product_component.dart';

class CartProductListviewComponent extends StatelessWidget {
  final List<CartProduct> products;
  const CartProductListviewComponent({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
      separatorBuilder: (context, index) => SizedBox(
        height: AppValues.sizeHeight * 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return CartItem(
          name: product.name,
          category: "clothing", // Update as necessary
          price: product.price,
          quantity: product.quantity,
          imageUrl: product.image,
          onAdd: () => context
              .read<CartBloc>()
              .add(UpdateCartQuantityEvent(product.id, product.quantity + 1)),
          onRemove: () => context
              .read<CartBloc>()
              .add(UpdateCartQuantityEvent(product.id, product.quantity - 1)),
        );
      },
    );
  }
}
