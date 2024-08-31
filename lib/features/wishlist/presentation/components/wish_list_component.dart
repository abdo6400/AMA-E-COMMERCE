import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/wishlist_bloc.dart';

class WishListComponent extends StatelessWidget {
  const WishListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading) {
          return const DefaultSimmerLoading(
              scrollDirection: Axis.vertical, type: SimmerLoadingType.grid);
        } else if (state is WishlistLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              bottom: AppValues.paddingHeight * 50,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: AppValues.sizeHeight * 5,
              crossAxisSpacing: AppValues.sizeWidth * 5,
              crossAxisCount: 2,
              mainAxisExtent: AppValues.sizeHeight * 220,
            ),
            itemCount: state.products.length,
            itemBuilder: (ctx, index) {
              return EcommerceComponents.productCard(
                onTap: () {},
                context: context,
                imageUrl: state.products[index].image,
                rating: state.products[index].rating,
                productName: state.products[index].name,
                isAvailable: state.products[index].isAvailable,
                price: state.products[index].price,
              );
            },
          );
        } else if (state is WishlistError) {
          return DefaultErrorMessage(
            message: state.message,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
