import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
          child: Row(
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
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 100,
          child: ListView.separated(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
            separatorBuilder: (context, index) => SizedBox(
              width: AppValues.sizeWidth * 15,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (item, index) => EcommerceElement.categoryCard(
              image: 'https://picsum.photos/1260/760?random=$index',
              title: 'category $index',
            ),
            itemCount: 10,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
          ),
        ),
      ],
    );
  }
}
