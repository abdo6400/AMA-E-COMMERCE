import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/app_strings.dart';

class EcommerceComponents extends StatelessWidget {
  ///
  /// [child] to return a custom widget depending on the requirement of the user
  ///
  final Widget? child;
  const EcommerceComponents({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }

  /// Slider with network images
  factory EcommerceComponents.slider({
    ///
    /// [slidersList] for slider images
    ///
    /// slidersList
    ///
    List<String>? slidersList,

    ///
    /// [viewportFraction] for slider aspect ratio
    ///
    /// aspectRatio
    ///
    double? viewportFraction,

    ///
    /// [aspectRatio] for slider aspect ratio
    ///
    /// aspectRatio
    ///
    double? aspectRatio,

    ///
    /// [height] for slider height
    ///
    /// height
    ///
    double? height,

    ///
    /// [enlargeCenterPage] for slider enlarge center page
    ///
    /// enlargeCenterPage
    ///
    bool? enlargeCenterPage,

    ///
    /// [autoPlay] for slider auto play
    ///
    /// autoPlay
    ///
    bool? autoPlay,

    ///
    /// [onTap] for slider on tap
    ///
    /// onTap
    ///
    Function()? onTap,
  }) {
    /// create a slider
    return EcommerceComponents(
      child: VxSwiper.builder(
        aspectRatio: aspectRatio ?? 16 / 9,
        autoPlay: autoPlay ?? true,
        height: height ?? AppValues.sizeHeight * 150,
        viewportFraction: viewportFraction ?? 0.8,
        enlargeCenterPage: enlargeCenterPage ?? true,
        itemCount: slidersList?.length ?? 2,
        itemBuilder: (context, index) {
          return Image.network(
            slidersList?[index] ??
                'https://picsum.photos/1260/760?random=$index',
            fit: BoxFit.fill,
          )
              .box
              .rounded
              .clip(Clip.antiAlias)
              .margin(
                  EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 10))
              .make()
              .onInkTap(onTap ?? () {});
        },
      ),
    );
  }

  /// Category card with network image
  factory EcommerceComponents.categoryCard({
    ///
    /// [image] for category image
    ///
    /// image
    ///
    String? image,

    ///
    /// [title] for category title
    ///
    /// title
    ///
    String? title,

    ///
    /// [titleColor] for category title color
    ///
    /// title color
    ///
    Color? titleColor,

    ///
    /// [titleFontFamily] for category title font family
    ///
    /// title font family
    ///
    String? titleFontFamily,

    ///
    /// [titleFontSize] for category title font size
    ///
    /// title font size
    ///
    double? titleFontSize,

    ///
    /// [description] for category description
    ///
    /// description
    ///
    String? description,

    ///
    /// [descriptionColor] for category description color
    ///
    /// description color
    ///
    Color? descriptionColor,

    ///
    /// [descriptionFontFamily] for category description font family
    ///
    /// description font family
    ///
    String? descriptionFontFamily,

    ///
    /// [descriptionFontSize] for category description font size
    ///
    /// description font size
    ///
    double? descriptionFontSize,

    ///
    /// [backgroundColor] for category card background color
    ///
    /// background color
    ///
    Color? backgroundColor,

    ///
    /// [onTap] for category card onTap
    ///
    /// onTap
    ///
    Function()? onTap,

    ///
    /// [height] for category card height
    ///
    /// height
    ///
    double? height,

    ///
    /// [width] for category card width
    ///
    /// width
    ///
    double? width,

    ///
    /// [imageBoxFit] for category card image box fit
    ///
    /// box fit
    ///
    BoxFit? imageBoxFit,
  }) {
    return EcommerceComponents(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: AppValues.radius * 42,
              child: CircleAvatar(
                radius: AppValues.radius * 40,
                backgroundImage: NetworkImage(image ?? ""),
              ),
            ),
          ),
          10.heightBox,
          Expanded(
            flex: 1,
            child: (title ?? 'Category Title')
                .text
                // .color(titleColor ?? Colors.black)
                .overflow(TextOverflow.ellipsis)
                .maxLines(1)
                .align(TextAlign.center)
                .fontFamily(titleFontFamily ?? 'sans-serif')
                .make(),
          ),
        ],
      )
          .box
          // .color(backgroundColor ?? Colors.white)
          .rounded
          .clip(Clip.antiAlias)
          //.outerShadowSm
          .make()
          .onTap(onTap ?? () {}),
    );
  }

  /// Cart item
  factory EcommerceComponents.cartItem({
    ///
    /// [image] for cart item image
    ///
    /// image
    ///
    String? image,

    ///
    /// [title] for cart item title
    ///
    /// title
    ///
    String? title,

    ///
    /// [titleColor] for cart item title color
    ///
    /// title color
    ///
    Color? titleColor,

    ///
    /// [titleFontFamily] for cart item title font family
    ///
    /// title font family
    ///
    String? titleFontFamily,

    ///
    /// [titleFontSize] for cart item title font size
    ///
    /// title font size
    ///
    double? titleFontSize,

    ///
    /// [subtitle] for cart item subtitle
    ///
    /// subtitle
    ///
    String? subtitle,

    ///
    /// [subtitleColor] for cart item subtitle color
    ///
    /// subtitle color
    ///
    Color? subtitleColor,

    ///
    /// [subtitleFontFamily] for cart item subtitle font family
    ///
    /// subtitle font family
    ///
    String? subtitleFontFamily,

    ///
    /// [subtitleFontSize] for cart item subtitle font size
    ///
    /// subtitle font size
    ///
    double? subtitleFontSize,

    ///
    /// [price] for cart item price
    ///
    /// price
    ///
    String? price,

    ///
    /// [priceColor] for cart item price color
    ///
    /// price color
    ///
    Color? priceColor,

    ///
    /// [priceFontFamily] for cart item price font family
    ///
    /// price font family
    ///
    String? priceFontFamily,

    ///
    /// [priceFontSize] for cart item price font size
    ///
    /// price font size
    ///
    double? priceFontSize,

    ///
    /// [onTap] for cart item onTap
    ///
    /// onTap
    ///
    Function()? onTap,

    ///
    /// [height] for cart item height
    ///
    /// height
    ///
    double? height,

    ///
    /// [width] for cart item width
    ///
    /// width
    ///
    double? width,

    ///
    /// [boxFit] for cart item image box fit
    ///
    /// box fit
    ///
    BoxFit? imageBoxFit,

    ///
    /// [productQuantity] for cart item product quantity
    ///
    /// product quantity
    ///
    int? productQuantity,

    ///
    /// [backgroundColor] for cart item background color
    ///
    /// background color
    ///
    Color? backgroundColor,

    ///
    /// [increaseQuantity] for cart item increase quantity
    ///
    /// increase quantity
    ///
    Function()? increaseQuantity,

    ///
    /// [decreaseQuantity] for cart item decrease quantity
    ///
    /// decrease quantity
    ///
    Function()? decreaseQuantity,

    ///
    /// [removeItem] for cart item remove item
    ///
    /// remove item
    ///
    Function()? removeItem,

    ///
    /// [showRemoveButton] for cart item show remove button
    ///
    /// show remove button
    ///
    bool? showRemoveButton,

    ///
    /// [productQuantityColor] for cart item product quantity color
    ///
    /// product quantity color
    ///
    Color? productQuantityColor,
  }) {
    return EcommerceComponents(
      child: Row(
        children: [
          Column(
            children: [
              Image.network(
                image ?? 'https://picsum.photos/200/300',
                height: height ?? 120,
                width: width ?? 200,
                fit: imageBoxFit ?? BoxFit.cover,
              ),
              10.heightBox,
              if (showRemoveButton ?? true)
                Row(
                  children: [
                    'Remove'
                        .text
                        .color(Colors.black)
                        .fontFamily('sans-serif')
                        .make(),
                    5.widthBox,
                    const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ).onInkTap(removeItem ?? () {}),
                  ],
                ).onInkTap(removeItem ?? () {})
            ],
          ),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (title ?? 'Category Title')
                  .text
                  .color(titleColor ?? Colors.black)
                  .align(TextAlign.center)
                  .fontFamily(titleFontFamily ?? 'sans-serif')
                  .make(),
              5.heightBox,
              (subtitle ?? 'Category Title')
                  .text
                  .color(subtitleColor ?? Colors.black)
                  .align(TextAlign.center)
                  .fontFamily(subtitleFontFamily ?? 'sans-serif')
                  .make(),
              5.heightBox,
              (price ?? 'Rs. 2000')
                  .text
                  .color(priceColor ?? Colors.black)
                  .align(TextAlign.center)
                  .fontFamily(priceFontFamily ?? 'sans-serif')
                  .make(),
            ],
          ).expand(),
          Row(
            children: [
              const Icon(
                Icons.remove,
                color: Colors.black,
              ).box.roundedSM.make().onInkTap(increaseQuantity ?? () {}),
              5.widthBox,
              (productQuantity ?? 0)
                  .text
                  .color(productQuantityColor ?? Colors.black)
                  .make(),
              5.widthBox,
              const Icon(
                Icons.add,
                color: Colors.black,
              ).box.roundedSM.make().onInkTap(decreaseQuantity ?? () {}),
            ],
          ),
        ],
      )
          .box
          .color(backgroundColor ?? Colors.white)
          .rounded
          .clip(Clip.antiAlias)
          .outerShadowSm
          .make()
          .onTap(onTap ?? () {}),
    );
  }

  /// Profile Image
  factory EcommerceComponents.profileImage({
    ///
    /// [image] for profile image
    ///
    /// profile image
    ///
    String? image,

    ///
    /// [height] for profile image height
    ///
    /// profile image height
    ///
    double? height,

    ///
    /// [width] for profile image width
    ///
    /// profile image width
    ///
    double? width,

    ///
    /// [boxFit] for profile image box fit
    ///
    /// profile image box fit
    ///
    BoxFit? imageBoxFit,

    ///
    /// [onTap] for profile image on tap
    ///
    /// profile image on tap
    ///
    Function()? onTap,
  }) {
    return EcommerceComponents(
      child: Image.network(
        image ?? 'https://picsum.photos/200/300',
        height: height ?? 100,
        width: width ?? 100,
        fit: imageBoxFit ?? BoxFit.cover,
      ).onInkTap(onTap ?? () {}),
    );
  }

  /// Prfile image circular
  factory EcommerceComponents.profileImageCircular({
    ///
    /// [image] for profile image
    ///
    /// profile image
    ///
    String? image,

    ///
    /// [height] for profile image height
    ///
    /// profile image height
    ///
    double? height,

    ///
    /// [width] for profile image width
    ///
    /// profile image width
    ///
    double? width,

    ///
    /// [boxFit] for profile image box fit
    ///
    /// profile image box fit
    ///
    BoxFit? imageBoxFit,

    ///
    /// [onTap] for profile image on tap
    ///
    /// profile image on tap
    ///
    Function()? onTap,
  }) {
    return EcommerceComponents(
      child: Image.network(
        image ?? 'https://picsum.photos/200/300',
        height: height ?? 100,
        width: width ?? 100,
        fit: imageBoxFit ?? BoxFit.cover,
      ).box.roundedFull.make().onInkTap(onTap ?? () {}),
    );
  }

  /// Increase Decrease Quantity
  factory EcommerceComponents.increaseDecreaseQuantity({
    ///
    /// [productQuantity] for product quantity
    ///
    /// product quantity
    ///
    int? productQuantity,

    ///
    /// [productQuantityColor] for product quantity color
    ///
    /// product quantity color
    ///
    Color? productQuantityColor,

    ///
    /// [backgroundColor] for background color
    ///
    /// background color
    ///
    Color? backgroundColor,

    ///
    /// [increaseQuantity] for increase quantity
    ///
    /// increase quantity
    ///
    Function()? increaseQuantity,

    ///
    /// [decreaseQuantity] for decrease quantity
    ///
    /// decrease quantity
    ///
    Function()? decreaseQuantity,
  }) {
    return EcommerceComponents(
      child: Row(
        children: [
          const Icon(
            Icons.remove,
            color: Colors.black,
          ).box.roundedSM.make().onInkTap(decreaseQuantity ?? () {}),
          5.widthBox,
          (productQuantity ?? 0)
              .text
              .color(productQuantityColor ?? Colors.black)
              .make(),
          5.widthBox,
          const Icon(
            Icons.add,
            color: Colors.black,
          ).box.roundedSM.make().onInkTap(increaseQuantity ?? () {}),
        ],
      ),
    );
  }

  factory EcommerceComponents.menuItem({
    ///
    /// [onTap] for on tap
    ///
    /// on tap
    ///
    Function()? onTap,

    ///
    /// [leading] for leading
    ///
    /// leading
    ///
    Widget? leading,

    ///
    /// [title] for title
    ///
    /// title
    ///
    Widget? title,

    ///
    /// [subtitle] for subtitle
    ///
    /// subtitle
    ///
    Widget? subtitle,

    ///
    /// [trailing] for trailing
    ///
    /// trailing
    ///
    Widget? trailing,

    ///
    /// [backgroundColor] for background color
    ///
    /// background color
    ///
    Color? backgroundColor,
  }) {
    return EcommerceComponents(
      child: ListTile(
        tileColor: backgroundColor ?? Colors.white,
        onTap: onTap ?? () {},
        leading: leading,
        title: title ?? 'Title'.text.make(),
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }

  /// Hedaing
  factory EcommerceComponents.heading({
    ///
    /// [title] for title
    ///
    /// title
    ///
    String? title,

    ///
    /// [titleColor] for title Color
    ///
    /// title COlor
    ///
    Color? titleColor,

    ///
    /// [titleFontFamily]
    ///
    /// Titlw Font Family
    ///
    String? titleFontFamily,

    ///
    /// [titleFontWeight] for title font weight
    ///
    /// title font weight
    ///
    FontWeight? titleFontWeight,

    ///
    /// [titleFontSize] for title font size
    ///
    /// title font size
    ///
    double? titleFontSize,

    ///
    /// [subtitle] for subtitle
    ///
    /// subtitle
    ///
    String? subtitle,

    ///
    /// [subtitleColor] for subtitle Color
    ///
    /// subtitle Color
    ///
    Color? subtitleColor,

    ///
    /// [subtitleFontFamily]
    ///
    /// subtitle Font Family
    ///
    String? subtitleFontFamily,

    ///
    /// [subtitleFontWeight] for subtitle font weight
    ///
    /// subtitle font weight
    ///
    FontWeight? subtitleFontWeight,

    ///
    /// [subtitleFontSize] for subtitle font size
    ///
    /// subtitle font size
    ///
    double? subtitleFontSize,

    ///
    /// [onTap] for on tap
    ///
    /// on tap
    ///
    Function()? onTap,

    ///
    /// [trailing] for trailing
    ///
    /// trailing
    ///
    Widget? trailing,

    ///
    /// [backgroundColor] for background color
    ///
    /// background color
    ///
    Color? backgroundColor,
  }) {
    return EcommerceComponents(
      child: ListTile(
        tileColor: backgroundColor ?? Colors.white,
        onTap: onTap ?? () {},
        title: (title ?? 'Title')
            .text
            .color(titleColor ?? Colors.black)
            .fontFamily(titleFontFamily ?? 'sans-serif')
            .fontWeight(titleFontWeight ?? FontWeight.bold)
            .size(titleFontSize ?? 20)
            .make(),
        subtitle: (subtitle ?? '')
            .text
            .color(subtitleColor ?? Colors.grey.shade500)
            .fontFamily(subtitleFontFamily ?? 'sans-serif')
            .fontWeight(subtitleFontWeight ?? FontWeight.normal)
            .size(subtitleFontSize ?? 16)
            .make(),
        trailing: trailing ?? const SizedBox(),
      ),
    );
  }

  /// Slide Show of product images
  factory EcommerceComponents.slideShow({
    ///
    /// [images] for images
    ///
    /// images
    ///
    List<String>? images,

    ///
    /// [height] for height
    ///
    /// height
    ///
    double? height,

    ///
    /// [aspectRatio] for aspect ratio
    ///
    /// aspect ratio
    ///
    double? aspectRatio,

    ///
    /// [autoPlay] for auto play
    ///
    /// auto play
    ///
    bool? autoPlay,

    ///
    /// [imageBoxFit] for image fit
    ///
    /// image fit
    ///
    BoxFit? imageBoxFit,

    ///
    /// [imageWidth] for image width
    ///
    /// image width
    ///
    double? imageWidth,

    ///
    /// [imageHeight] for image height
    ///
    /// image height
    ///
    double? imageHeight,
  }) {
    return EcommerceComponents(
      child: VxSwiper.builder(
          autoPlay: autoPlay ?? true,
          height: height ?? 350,
          viewportFraction: 1.0,
          aspectRatio: aspectRatio ?? 16 / 9,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          itemCount: images?.length ?? 3,
          itemBuilder: (context, index) {
            return Image.network(
              images?[index] ??
                  'https://picsum.photos/1260/760?random=${index + 1}',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  // Image has finished loading
                  return child;
                } else {
                  // Image is still loading
                  return Center(
                    child: LinearProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                // Handle image loading errors
                return const Center(
                  child: Icon(Icons.error, color: Colors.red),
                );
              },
              height: imageHeight ?? double.infinity,
              width: imageWidth ?? double.infinity,
              fit: imageBoxFit ?? BoxFit.cover,
            );
          }),
    );
  }

  /// Rating
  factory EcommerceComponents.rating({
    ///
    /// [onRatingUpdate] for on rating update
    ///
    /// on rating update
    ///
    Function(String)? onRatingUpdate,

    ///
    /// [normalColor] for normal color
    ///
    /// normal color
    ///
    Color? normalColor,

    ///
    /// [selectionColor] for selection color
    ///
    /// selection color
    ///
    Color? selectionColor,

    ///
    /// [count] for count
    ///
    /// count
    ///
    int? count,

    ///
    /// [size] for size
    ///
    /// size
    ///
    double? size,

    ///
    /// [stepInt] for step int
    ///
    /// step int
    ///
    bool? stepInt,

    ///
    /// [isSelectable] for is selectable
    ///
    /// is selectable
    ///
    bool? isSelectable,
  }) {
    return EcommerceComponents(
      child: VxRating(
        isSelectable: isSelectable ?? true,
        onRatingUpdate: onRatingUpdate ?? (value) {},
        normalColor: normalColor ?? Colors.grey.shade300,
        selectionColor: selectionColor ?? Colors.amber,
        count: count ?? 5,
        size: size ?? 20,
        stepInt: stepInt ?? true,
      ),
    );
  }

  factory EcommerceComponents.productCard({
    /// The URL of the product image.
    required String imageUrl,

    /// The category name of the product.
    String? categoryName,

    /// The name of the product.
    required String productName,

    /// The price of the product.
    required double price,

    /// The currency symbol used for the price.
    String currency = '\$',

    /// A callback function triggered when the card is tapped.
    VoidCallback? onTap,

    /// A callback function triggered when the favorite button is pressed.
    VoidCallback? onFavoritePressed,

    /// Indicates whether the product is available.
    bool isAvailable = true,

    /// The background color of the card.
    Color cardColor = Colors.white,

    /// The text color used for labels and descriptions.
    Color textColor = Colors.black,

    /// The border radius of the card.
    double borderRadius = 12.0,

    /// The rating of the product (optional).
    double? rating,
    required BuildContext context,
    bool isFavorite = false,

    /// The discount percentage of the product (optional).
    double? discountPercentage,
  }) {
    return EcommerceComponents(
      child: InkWell(
        radius: AppValues.radius * 10,
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 20),
          ),
          elevation: 0.5,
          // color: cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image and favorite button
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Builder(
                        builder: (context) {
                          try {
                            return Image.network(
                              imageUrl,
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
                      child: StatefulBuilder(builder: (context, setState) {
                        return IconButton(
                          onPressed: () {
                            if (onFavoritePressed != null) {
                              onFavoritePressed();
                            }
                          },
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                        );
                      }),
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
                        productName,
                        style: Theme.of(context).textTheme.titleSmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),

                      // Product rating (if available)
                      if (rating != null)
                        Padding(
                          padding:
                              EdgeInsets.only(top: AppValues.paddingHeight * 5),
                          child: Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index < rating.round()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: Colors.amber,
                                size: AppValues.font * 15,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: AppValues.sizeHeight * 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('$currency${price.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodyLarge),
                          if (discountPercentage != null)
                            SizedBox(
                              width: AppValues.sizeWidth * 5,
                            ),
                          if (discountPercentage != null)
                            Text(
                                '${discountPercentage.toStringAsFixed(0)}% ${AppStrings.off}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .error)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
