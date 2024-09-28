library cart_item;

import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_product.dart';
import '../bloc/cart_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartProduct,
  });
  final CartProduct? cartProduct;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0.5,
          margin: AppLocalizations.of(context)!.isEnLocale
              ? EdgeInsets.only(left: AppValues.marginWidth * 20)
              : EdgeInsets.only(right: AppValues.marginWidth * 20),
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 20),
            side:
                BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 10,
                vertical: AppValues.paddingHeight * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppValues.radius * 20),
                          child: Padding(
                            padding: EdgeInsets.all(AppValues.radius * 5),
                            child: cartProduct != null
                                ? Image(
                                    image: NetworkImage(
                                        cartProduct!.product.images[0]),
                                    height: AppValues.sizeHeight * 80,
                                    fit: BoxFit.fill,
                                  )
                                : Container(
                                    height: AppValues.sizeHeight * 80,
                                    color: Theme.of(context).hintColor,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppValues.sizeWidth * 15,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(
                                cartProduct != null
                                    ? cartProduct!.product.titleEn
                                    : "loading...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: AppValues.font * 16)),
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(
                                cartProduct != null
                                    ? cartProduct!.product.descriptionEn
                                    : "loading...",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(
                              cartProduct != null
                                  ? '${cartProduct!.product.price} EGP'
                                  : "0.0 €",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        IconButton.outlined(
                            onPressed: () => cartProduct != null
                                ? context.read<CartBloc>().add(
                                    UpdateCartQuantityEvent(cartProduct!.id,
                                        cartProduct!.quantity + 1))
                                : null,
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                        SizedBox(
                          height: AppValues.sizeHeight * 8,
                        ),
                        Text(
                          cartProduct != null
                              ? cartProduct!.quantity.toString()
                              : "0",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: AppValues.font * 15,
                              ),
                        ),
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        IconButton(
                            onPressed: () => cartProduct != null
                                ? context.read<CartBloc>().add(
                                      UpdateCartQuantityEvent(cartProduct!.id,
                                          cartProduct!.quantity - 1),
                                    )
                                : null,
                            icon: const Icon(Icons.remove)),
                      ],
                    ))
              ],
            ),
          ),
        ),
        IconButton.outlined(
            onPressed: () => cartProduct != null
                ? context.read<CartBloc>().add(
                      RemoveProductFromCartEvent(cartProduct!.id),
                    )
                : null,
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppValues.radius * 5),
            )),
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.error,
            )),
      ],
    );
  }
}
