import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/utils/app_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
            right: AppValues.paddingWidth * 10,
            left: AppValues.paddingWidth * 10,
            top: AppValues.paddingHeight * 10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.bestOffers.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      AppStrings.viewAll.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                      selectionColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppValues.sizeHeight * 15,
              ),
              EcommerceElement.slider(),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 25),
            child: const Divider(),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.categories.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      AppStrings.viewAll.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                      selectionColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
              EcommerceElement.categoryCard(),
            ],
          ),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 25),
            child: const Divider(),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.bestSeller.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      AppStrings.viewAll.tr(context),
                      style: Theme.of(context).textTheme.titleMedium,
                      selectionColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
              EcommerceElement.productCard(),
            ],
          ),
          // EcommerceElement.rating(),
          // EcommerceElement.cartItem(),
          // EcommerceElement.categoryCard(),
          // EcommerceElement.productCard(),
          // EcommerceElement.menuItem(),
          // EcommerceElement.profileImage(),
          // EcommerceElement.featuredButtonAsset(),
        ],
      ),
    );
  }
}
