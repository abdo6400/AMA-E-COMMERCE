import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../utils/app_values.dart';

class DefaultMessageCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  const DefaultMessageCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: (AppValues.radius * 30),
            
            child: CircleAvatar(
              radius: (AppValues.radius * 25),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Icon(icon,color:Theme.of(context).colorScheme.secondary),
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              children: [
                Text(title.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge),
                SizedBox(
                  height: AppValues.sizeHeight * 10,
                ),
                Text(subTitle.tr(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          )
        ],
      ),
    );
  }
}
