import 'dart:io';
import 'package:flutter/material.dart';
import '../../utils/app_strings.dart';
import 'mobile_home_layout.dart';
import 'windows_home_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Map<String, dynamic>> _screens = [
    {"icon": Icons.home, "title": AppStrings.home, "screen": const Card()},
    {
      "icon": Icons.receipt,
      "title": AppStrings.invoices,
      "screen": const Card()
    },
    /* {
      "icon": Icons.search_sharp,
      "title": AppStrings.search,
      "screen":  SearchScreen()
    },*/
    
    {"icon": Icons.person, "title": AppStrings.profile, "screen": const Card()},
  ];

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || Platform.isIOS
        ? MobileHomeLayout(screens: _screens)
        : WindowsHomeLayout(
            screens: _screens,
          );
  }
}
