import 'package:flutter/material.dart';
import '../../../features/cart/presentation/screens/cart_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/wishlist/presentation/screens/wishlist_screen.dart';
import '../../utils/app_strings.dart';
import 'mobile_components/mobile_home_layout.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Map<String, dynamic>> _screens = [
    {
      "icon": Icons.dashboard,
      "iconBorder": Icons.dashboard_outlined,
      "title": AppStrings.shopping,
      "screen": const HomeScreen()
    },
    {
      "icon": Icons.favorite,
      "iconBorder": Icons.favorite_border,
      "title": AppStrings.favourite,
      "screen": const WithListScreen()
    },
    {
      "icon": Icons.shopping_cart_checkout,
      "iconBorder": Icons.shopping_cart_checkout_outlined,
      "title": AppStrings.cart,
      "screen": const CartScreen()
    },
    {
      "icon": Icons.account_circle,
      "iconBorder": Icons.account_circle_outlined,
      "title": AppStrings.account,
      "screen": const ProfileScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MobileHomeLayout(screens: _screens);
    // Platform.isAndroid || Platform.isIOS
    //     ? MobileHomeLayout(screens: _screens)
    //     : WindowsHomeLayout(
    //         screens: _screens,
    //       );
  }
}
