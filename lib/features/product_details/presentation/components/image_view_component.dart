import 'package:ama/config/database/api/end_points.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:popup_banner/popup_banner.dart';

import '../../../../core/utils/app_values.dart';

class ImageViewComponent extends StatelessWidget {
  final List<String> images;
  const ImageViewComponent({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      layout: SwiperLayout.CUSTOM,
      customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
        ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
        ..addTranslate([
          const Offset(-370.0, -40.0),
          const Offset(0.0, 0.0),
          const Offset(370.0, -40.0)
        ]),
      itemWidth: AppValues.screenWidth * 0.92,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: AppValues.sizeHeight * 20),
          padding: EdgeInsets.symmetric(
              vertical: AppValues.paddingHeight * 20,
              horizontal: AppValues.paddingWidth * 20),
          child: Card(
              elevation: 0.1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppValues.radius * 50),
                side: BorderSide(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.5),
                    width: 1.0),
              ),
              margin: EdgeInsets.zero,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.radius * 50),
                  child: InkWell(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 50),
                      onTap: () {
                        PopupBanner(
                          context: context,
                          dotsColorActive:
                              Theme.of(context).colorScheme.secondary,
                          images: images.map((e) => "${EndPoints.images}$e").toList(),
                          dotsAlignment: Alignment.bottomCenter,
                          slideChangeDuration: Durations.long1,
                          onClick: (index) {},
                        ).show();
                      },
                      child: Image.network(
                          "${EndPoints.images}${images[index]}",
                          fit: BoxFit.fill)))),
        );
      },
      autoplay: true,
      itemCount: images.length,
      pagination: SwiperPagination(
        margin: EdgeInsets.only(top: AppValues.paddingHeight * 20),
        alignment: Alignment.bottomCenter,
        builder: DotSwiperPaginationBuilder(
            color: Theme.of(context).highlightColor,
            activeColor: Theme.of(context).primaryColor),
      ),
    );
  }
}
