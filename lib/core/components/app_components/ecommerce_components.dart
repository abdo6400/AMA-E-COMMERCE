import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
          Icon(
            Icons.remove,
            size: AppValues.font * 25,
          ).box.roundedSM.make().onInkTap(decreaseQuantity ?? () {}),
          5.widthBox,
          (productQuantity ?? 1)
              .text
              .color(productQuantityColor)
              .size(AppValues.font * 20)
              .make(),
          5.widthBox,
          CircleAvatar(
            child: Icon(
              Icons.add,
              size: AppValues.font * 20,
            ).box.roundedSM.make().onInkTap(increaseQuantity ?? () {}),
          ),
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
  factory EcommerceComponents.rating(
      {
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
      double? value}) {
    return EcommerceComponents(
      child: VxRating(
        isSelectable: isSelectable ?? true,
        value: value ?? 10,
        maxRating: 5,
        onRatingUpdate: onRatingUpdate ?? (value) {},
        normalColor: normalColor ?? Colors.grey.shade300,
        selectionColor: selectionColor ?? Colors.amber,
        count: count ?? 5,
        size: size ?? 20,
        stepInt: stepInt ?? true,
      ),
    );
  }
}
