import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class WithListScreen extends StatelessWidget {
  const WithListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 10,
          vertical: AppValues.paddingHeight * 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppValues.sizeHeight * 10),
            Text(
              AppStrings.favourite.tr(context),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppValues.sizeHeight * 5),
            const Divider(),
            SizedBox(height: AppValues.sizeHeight * 10),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    bottom: AppValues.paddingHeight * 50,
                    left: AppValues.paddingWidth * 5,
                    right: AppValues.paddingWidth * 5,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: AppValues.sizeHeight * 5,
                    crossAxisSpacing: AppValues.sizeWidth * 5,
                    crossAxisCount: 2,
                    mainAxisExtent: AppValues.sizeHeight * 240,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) => ProductCard(
                        onTap: () {},
                        imageUrl:
                            'https://picsum.photos/1260/760?random=$index',
                        categoryName: 'prdouct $index',
                        rating: index * 1.0,
                        productName: 'prdouct $index',
                        isAvailable: index / 2.0 == 1,
                        // discountPercentage: 10,
                        price: 10.0,
                      )),
            ),
          ]),
    );
  }
}
