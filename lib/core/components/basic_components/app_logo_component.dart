import 'package:flutter/material.dart';

import '../../utils/app_images.dart';
import '../../utils/app_values.dart';

class AppLogoComponent extends StatelessWidget {
  const AppLogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppValues.paddingHeight * 20),
      child: CircleAvatar(
        radius: AppValues.radius * 40,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 100),
            child: Image.asset(AppImages.appLogo)),
      ),
    );
  }
}
