import 'package:ama/features/home/presentation/components/ads_component.dart';
import 'package:ama/features/home/presentation/components/best_seller_component.dart';
import 'package:ama/features/home/presentation/components/categories_component.dart';
import 'package:ama/features/home/presentation/components/offers_component.dart';
import 'package:flutter/material.dart';
import '../components/custom_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        AdsComponent(),
        CustomDivider(),
        Column(
          children: [
            OffersComponent(),
            CustomDivider(),
            CategoriesComponent(),
            CustomDivider(),
            BestSellerComponent()
          ],
        ),
      ],
    );
  }
}
