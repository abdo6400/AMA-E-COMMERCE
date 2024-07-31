import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cart_bloc.dart';
import 'cart_product_component.dart';

class CartProductListviewComponent extends StatelessWidget {
  const CartProductListviewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInternetConnectionChecker(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const DefaultSimmerLoading(
              type: SimmerLoadingType.list,
              scrollDirection: Axis.vertical,
            );
          } else if (state is CartLoaded) {
            return ListView.separated(
              padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
              separatorBuilder: (context, index) => SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return CartItem(
                  name: product.name,
                  category: "clothing", // Update as necessary
                  price: product.price,
                  quantity: product.quantity,
                  imageUrl: product.image,
                  onAdd: () => context.read<CartBloc>().add(
                      UpdateCartQuantityEvent(
                          product.id, product.quantity + 1)),
                  onRemove: () => context.read<CartBloc>().add(
                      UpdateCartQuantityEvent(
                          product.id, product.quantity - 1)),
                );
              },
            );
          } else if (state is CartError) {
            return DefaultErrorMessage(
              message: state.message,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
