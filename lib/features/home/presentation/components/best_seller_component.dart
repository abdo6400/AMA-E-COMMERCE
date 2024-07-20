import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class BestSellerComponent extends StatelessWidget {
  const BestSellerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
               padding:  EdgeInsets.symmetric(horizontal: AppValues.paddingWidth*10),
          child: Row(
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
        ),
        SizedBox(
          height: AppValues.sizeHeight * 20,
        ),
        SizedBox(
          height: AppValues.sizeHeight * 600,
          child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                bottom: AppValues.paddingHeight * 50,
                left: AppValues.paddingWidth * 10,
                right: AppValues.paddingWidth * 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: AppValues.sizeHeight * 10,
                  crossAxisSpacing: AppValues.sizeWidth * 10,
                  crossAxisCount: 2,
                  mainAxisExtent: AppValues.sizeHeight * 180),
              itemCount: 8,
              itemBuilder: (context, index) => ProductCard(
                    onTap: () {},
                    imageUrl: 'https://picsum.photos/1260/760?random=$index',
                    categoryName: 'prdouct $index',
                    rating: index * 1.0,
                    productName: 'prdouct $index',
                    isAvailable: index / 2.0 == 1,
                   // discountPercentage: 10,
                    price: 10.0,
                  )),
        )
      ],
    );
  }
}
