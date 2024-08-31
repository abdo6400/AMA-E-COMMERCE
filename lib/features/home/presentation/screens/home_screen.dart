import 'package:ama/core/components/default_components/default_internet_connection_checker.dart';
import 'package:ama/features/home/presentation/components/best_seller_component.dart';
import 'package:ama/features/home/presentation/components/categories_component.dart';
import 'package:ama/features/home/presentation/components/offers_component.dart';
import 'package:flutter/material.dart';
import '../components/custom_divider.dart';
import '../components/recommended_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInternetConnectionChecker(
      child: ListView(
        children: const [
          // // AdsComponent(),
          // CustomDivider(),
          Column(
            children: [
              OffersComponent(),
              CustomDivider(),
              CategoriesComponent(),
              CustomDivider(),
              RecommendedComponent(),
              CustomDivider(),
              BestSellerComponent()
            ],
          ),
        ],
      ),
    );
  }
}
