import 'package:flutter/material.dart';
import '../../../../core/components/default_components/default_message_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../domain/entities/cart_product.dart';
import 'cart_product_component.dart';

class CartProductListviewComponent extends StatelessWidget {
  final List<CartProduct> products;
  final bool isLoading;
  const CartProductListviewComponent(
      {super.key, required this.products, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty && !isLoading) {
      return const DefaultMessageCard(
        icon: Icons.shopping_bag_outlined,
        title: AppStrings.cartIsEmpty,
        subTitle: AppStrings.continueShoppingAndAddProductsToYourCart,
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
      separatorBuilder: (context, index) => SizedBox(
        height: AppValues.sizeHeight * 10,
      ),
      itemCount: isLoading ? 3 : products.length,
      itemBuilder: (context, index) {
        return CartItem(
          cartProduct: isLoading ? null : products[index],
        );
      },
    );
  }
}
