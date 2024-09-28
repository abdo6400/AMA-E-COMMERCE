import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../bloc/cubits/counter_cubit/counter_cubit.dart';

class BottomBarComponent extends StatelessWidget {
  final int id;
  const BottomBarComponent({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 20,
          vertical: AppValues.paddingHeight * 10),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.read<WishlistBloc>().add(
                  context.read<WishlistBloc>().favoriteItems.contains(id)
                      ? RemoveProductFromWishlistEvent(id)
                      : AddProductToWishlistEvent(id),
                ),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppValues.radius * 5),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 10,
                    vertical: AppValues.paddingHeight * 5),
                child: Icon(
                    context.watch<WishlistBloc>().favoriteItems.contains(id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color:
                        context.watch<WishlistBloc>().favoriteItems.contains(id)
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).hintColor),
              ),
            ),
          ),
          SizedBox(width: AppValues.sizeWidth * 10),
          Expanded(
            child: BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return DefaultButton(
                  radius: 5,
                  onPressed: () =>
                      context.read<CartBloc>().add(AddProductToCartEvent(
                            id,
                            state,
                          )),
                  text: AppStrings.addToCart,
                  elevation: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
