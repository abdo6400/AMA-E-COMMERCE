import 'package:flutter/material.dart';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_values.dart';
import '../../../../../core/utils/app_images.dart';

class TopBar extends StatelessWidget {
  final String title;
  final String subTitle;
  const TopBar({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Text(title.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: AppValues.font * 25,
                        )),
              ),
              Flexible(
                flex: 1,
                child: Material(
                  elevation: 1,
                  type: MaterialType.circle,
                  color: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: AppValues.radius * 40,
                    backgroundImage: const AssetImage(AppImages.appLogo),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 35,
          ),
          Text(
            subTitle.tr(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
