import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_message_card.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/wishlist_bloc.dart';

class WishListComponent extends StatelessWidget {
  const WishListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state.hasError) {
          return DefaultErrorMessage(
            message: state.message,
          );
        }
        if (state.hasData && state.products.isEmpty) {
          return const DefaultMessageCard(
            icon: Icons.favorite_outline,
            title: AppStrings.wishListEmpty,
            subTitle: AppStrings.continueShoppingAndAddProductsToWishList,
          );
        }

        return DefaultSimmerLoading(
          loading: state.isLoading,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              bottom: AppValues.paddingHeight * 50,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: AppValues.sizeHeight * 5,
              crossAxisSpacing: AppValues.sizeWidth * 5,
              crossAxisCount: 2,
              mainAxisExtent: AppValues.sizeHeight * 240,
            ),
            itemCount: state.hasData ? state.products.length : 4,
            itemBuilder: (ctx, index) {
              return ProductCard(
                product: state.hasData ? state.products[index].product : null,
              );
            },
          ),
        );
      },
    );
  }
}
