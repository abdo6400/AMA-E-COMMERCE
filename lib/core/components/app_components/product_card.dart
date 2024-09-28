import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/app_routes.dart';
import '../../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../entities/product.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isProductLoaded = product != null;
    return InkWell(
      radius: AppValues.radius * 10,
      onTap: () => isProductLoaded
          ? context.navigateTo(
              screenRoute: Routes.productDetailsRoute,
              arg: {
                "id": product!.id,
              },
            )
          : null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 10),
          side: BorderSide(color: Theme.of(context).hintColor.withOpacity(0.1)),
        ),
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 10),
                      child: Padding(
                        padding: EdgeInsets.all(AppValues.radius * 10),
                        child: isProductLoaded
                            ? Image.network(
                                product!.images[0],
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Theme.of(context).hintColor,
                              ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 10,
                    vertical: AppValues.paddingHeight * 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isProductLoaded ? product!.titleEn : "",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: AppValues.font * 14,
                              ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: AppValues.sizeHeight * 5),
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              isProductLoaded
                                  ? product!.price.toStringAsFixed(2)
                                  : 0.0.toStringAsFixed(2),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: AppValues.font * 16,
                                  ),
                            ),
                            Text(
                              " \$",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: AppValues.font * 16,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: AppValues.sizeHeight * 4),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          tooltip: AppStrings.addToFavorite.tr(context),
                          onPressed: () => isProductLoaded
                              ? context.read<WishlistBloc>().add(
                                    context
                                            .read<WishlistBloc>()
                                            .favoriteItems
                                            .contains(product!.id)
                                        ? RemoveProductFromWishlistEvent(
                                            product!.id)
                                        : AddProductToWishlistEvent(
                                            product!.id),
                                  )
                              : null,
                          icon: Icon(
                            context
                                    .watch<WishlistBloc>()
                                    .favoriteItems
                                    .contains(isProductLoaded ? product!.id : 0)
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: context
                                    .watch<WishlistBloc>()
                                    .favoriteItems
                                    .contains(isProductLoaded ? product!.id : 0)
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: AppValues.paddingHeight * 5),
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index <
                                        (isProductLoaded
                                            ? product!.rating.round()
                                            : 5)
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: AppValues.font * 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
