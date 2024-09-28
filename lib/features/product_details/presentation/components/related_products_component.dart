import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/entities/product.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class RelatedProductsComponent extends StatelessWidget {
  final List<Product> products;
  const RelatedProductsComponent({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.screenWidth,
      height: AppValues.sizeHeight * 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.relatedProducts.tr(context),
              style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(
            height: AppValues.sizeHeight * 10,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) => SizedBox(
                  width: AppValues.sizeWidth * 200,
                  child: ProductCard(
                    product: products[index],
                  )),
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: AppValues.sizeWidth * 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
