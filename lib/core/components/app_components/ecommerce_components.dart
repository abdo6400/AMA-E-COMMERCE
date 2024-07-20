import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EcommerceElement extends StatelessWidget {
  ///
  /// [child] to return a custom widget depending on the requirement of the user
  ///
  final Widget? child;
  const EcommerceElement({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }

  /// Slider with network images
  factory EcommerceElement.slider({
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
    return EcommerceElement(
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

  /// Product card
  factory EcommerceElement.productCard({
    ///
    /// [image] is required
    ///
    /// image
    ///
    String? image,

    ///
    /// [title] for product title
    ///
    /// title
    ///
    String? title,

    ///
    /// [titleColor] for product title color
    ///
    /// title color
    ///
    Color? titleColor,

    ///
    /// [titleFontFamily] for product title font family
    ///
    /// title font family
    ///
    String? titleFontFamily,

    ///
    /// [titleFontSize] for product title font size
    ///
    /// title font size
    ///
    double? titleFontSize,

    ///
    /// [price] for product price
    ///
    /// price
    ///
    String? price,

    ///
    /// [priceColor] for product price color
    ///
    /// price color
    ///
    Color? priceColor,

    ///
    /// [priceFontFamily] for product price font family
    ///
    /// price font family
    ///
    String? priceFontFamily,

    ///
    /// [priceFontSize] for product price font size
    ///
    /// price font size
    ///
    double? priceFontSize,

    ///
    /// [description] for product description
    ///
    /// description
    ///
    String? description,

    ///
    /// [descriptionColor] for product description color
    ///
    /// description color
    ///
    Color? descriptionColor,

    ///
    /// [descriptionFontFamily] for product description font family
    ///
    /// description font family
    ///
    String? descriptionFontFamily,

    ///
    /// [descriptionFontSize] for product description font size
    ///
    /// description font size
    ///
    double? descriptionFontSize,

    ///
    /// [backgroundColor] for product card background color
    ///
    /// background color
    ///
    Color? backgroundColor,

    ///
    /// [width] for product card width
    ///
    /// width
    ///
    double? width,

    ///
    /// [boxFit] for product card image box fit
    ///
    /// box fit
    ///
    BoxFit? imageBoxFit,

    ///
    /// [onTap] for product card on tap
    ///
    /// on tap
    ///
    Function()? onTap,
  }) {
    return EcommerceElement(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppValues.radius * 10),
              child: Image.network(
                image ??
                    'https://images.pexels.com/photos/380954/pexels-photo-380954.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                fit: imageBoxFit ?? BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                10.heightBox,
                (title ?? 'Product Title')
                    .text
                    .color(titleColor ?? Colors.black)
                    .fontFamily(titleFontFamily ?? 'sans-serif')
                    .size(titleFontSize ?? 14)
                    .make(),
                10.heightBox,
                (price ?? 'Rs. 2000')
                    .text
                    .color(priceColor ?? Colors.black)
                    .fontFamily(priceFontFamily ?? 'sans-serif')
                    .size(priceFontSize ?? 16)
                    .make(),
                10.heightBox,
              ],
            ),
          )
        ],
      )
          .box
          .color(backgroundColor ?? Colors.white)
          .topRightRounded(value: AppValues.radius * 40)
          .bottomLeftRounded(value: AppValues.radius * 40)
          .topLeftRounded(value: AppValues.radius * 10)
          .bottomRightRounded(value: AppValues.radius * 10)
          .make()
          .onInkTap(onTap ?? () {}),
    );
  }

  /// Category card with network image
  factory EcommerceElement.categoryCard({
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
    return EcommerceElement(
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
  factory EcommerceElement.cartItem({
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
    return EcommerceElement(
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
  factory EcommerceElement.profileImage({
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
    return EcommerceElement(
      child: Image.network(
        image ?? 'https://picsum.photos/200/300',
        height: height ?? 100,
        width: width ?? 100,
        fit: imageBoxFit ?? BoxFit.cover,
      ).onInkTap(onTap ?? () {}),
    );
  }

  /// Prfile image circular
  factory EcommerceElement.profileImageCircular({
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
    return EcommerceElement(
      child: Image.network(
        image ?? 'https://picsum.photos/200/300',
        height: height ?? 100,
        width: width ?? 100,
        fit: imageBoxFit ?? BoxFit.cover,
      ).box.roundedFull.make().onInkTap(onTap ?? () {}),
    );
  }

  /// Increase Decrease Quantity
  factory EcommerceElement.increaseDecreaseQuantity({
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
    return EcommerceElement(
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

  factory EcommerceElement.menuItem({
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
    return EcommerceElement(
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
  factory EcommerceElement.heading({
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
    return EcommerceElement(
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
  factory EcommerceElement.slideShow({
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
    return EcommerceElement(
      child: VxSwiper.builder(
          autoPlay: autoPlay ?? true,
          height: height ?? 350,
          viewportFraction: 1.0,
          aspectRatio: aspectRatio ?? 16 / 9,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          itemCount: images?.length ?? 3,
          itemBuilder: (context, index) {
            return Image.network(
              images?[index] ?? 'https://picsum.photos/1260/760?random=${index + 1}',
              height: imageHeight ?? double.infinity,
              width: imageWidth ?? double.infinity,
              fit: imageBoxFit ?? BoxFit.cover,
            );
          }),
    );
  }

  /// Rating
  factory EcommerceElement.rating({
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
    return EcommerceElement(
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
}
