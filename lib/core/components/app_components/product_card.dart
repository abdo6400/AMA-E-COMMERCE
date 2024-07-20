import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../utils/app_strings.dart';

/// A customizable card widget for displaying product information.
class ProductCard extends StatefulWidget {
  /// The unique identifier of the product.
  final String? id;

  /// The URL of the product image.
  final String imageUrl;

  /// A short description of the product.
  final String? shortDescription;

  /// The category name of the product.
  final String categoryName;

  /// The name of the product.
  final String productName;

  /// The price of the product.
  final double price;

  /// The currency symbol used for the price.
  final String currency;

  /// A callback function triggered when the card is tapped.
  final VoidCallback? onTap;

  /// A callback function triggered when the favorite button is pressed.
  final VoidCallback? onFavoritePressed;

  /// Indicates whether the product is available.
  final bool? isAvailable;

  /// The background color of the card.
  final Color cardColor;

  /// The text color used for labels and descriptions.
  final Color textColor;

  /// The border radius of the card.
  final double borderRadius;

  /// The rating of the product (optional).
  final double? rating;

  /// The discount percentage of the product (optional).
  final double? discountPercentage;

  /// Creates a [ProductCard] widget.
  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.productName,
    required this.price,
    this.currency = '\$',
    this.onTap,
    this.onFavoritePressed,
    this.shortDescription = '',
    this.id,
    this.isAvailable = true,
    this.cardColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
    this.borderRadius = 12.0,
    this.rating,
    this.discountPercentage,
  });

  @override
  ProductCardState createState() => ProductCardState();
}

class ProductCardState extends State<ProductCard> {
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: AppValues.radius * 10,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 10),
        ),
        elevation: 4,
        //  color: widget.cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image and favorite button
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: Builder(
                      builder: (context) {
                        try {
                          return Image.network(
                            widget.imageUrl,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          );
                        } catch (e) {
                          // Handle error
                          return const Center(
                            child: Text('Failed to load image'),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isAdded = !_isAdded;
                        });
                        if (widget.onFavoritePressed != null) {
                          widget.onFavoritePressed!();
                        }
                      },
                      icon: Icon(
                        _isAdded
                            ? Icons.favorite_rounded
                            : Icons.favorite_outline_rounded,
                        color: _isAdded ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Product details
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 10,
                    vertical: AppValues.paddingHeight * 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppValues.sizeHeight * 2),
                    Text(
                      widget.categoryName,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    // Short description (if provided)
                    if (widget.shortDescription!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          widget.shortDescription!,
                          style: TextStyle(
                            color: widget.textColor.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    // Product rating (if available)
                    if (widget.rating != null)
                      Padding(
                        padding:
                            EdgeInsets.only(top: AppValues.paddingHeight * 5),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < widget.rating!.round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: AppValues.font * 15,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: AppValues.sizeHeight * 5),
                    // Product availability and price
/**if (widget.isAvailable!)
                          Text(
                            AppStrings.available.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.greenDark),
                          ),
                        if (!widget.isAvailable!)
                          Text(
                            AppStrings.outOffStock.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.error),
                          ), */
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            '${widget.currency}${widget.price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyLarge),
                        if (widget.discountPercentage != null)
                          SizedBox(
                            width: AppValues.sizeWidth * 5,
                          ),
                        if (widget.discountPercentage != null)
                          Text(
                              '${widget.discountPercentage?.toStringAsFixed(0)}% ${AppStrings.off}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error)),
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
