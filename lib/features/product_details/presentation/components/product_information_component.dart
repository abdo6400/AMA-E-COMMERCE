import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/features/product_details/presentation/components/colors_component.dart';
import 'package:ama/features/product_details/presentation/components/sizes_component.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_details.dart';

class ProductInformationComponent extends StatelessWidget {
  final ProductDetails product;
  const ProductInformationComponent({super.key, required this.product});
  TableRow buildRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: EdgeInsets.all(AppValues.radius * 5),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppValues.radius * 5),
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.sizes.isNotEmpty)
          SizesComponent(
            sizes: product.sizes,
          ),
        SizedBox(height: AppValues.sizeHeight * 10),
        if (product.colors.isNotEmpty) ColorsComponent(colors: product.colors),
        SizedBox(height: AppValues.sizeHeight * 10),
        ExpansionTile(
            title: Text(
              AppStrings.moreInformation.tr(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            initiallyExpanded: true,
            tilePadding: EdgeInsets.zero,
            children: [
              Table(
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                },
                children: [
                  if (product.brand.isNotEmpty)
                    buildRow('Brand:', product.brand),
                  if (product.material.isNotEmpty)
                    buildRow('Material:', product.material),
                  if (product.dimensions.isNotEmpty)
                    buildRow('Dimensions:', product.dimensions),
                  if (product.weight != 0.0)
                    buildRow('Weight:', '${product.weight} kg'),
                  if (product.warranty.isNotEmpty)
                    buildRow('Warranty:', product.warranty),
                  if (product.features.isNotEmpty)
                    buildRow('Features:', product.features),
                  if (product.gender.isNotEmpty)
                    buildRow('Gender:', product.gender),
                  if (product.ageRange.isNotEmpty)
                    buildRow('Age Range:', product.ageRange),
                  if (product.expiryDate != null)
                    buildRow('Expiry Date:',
                        product.expiryDate.toString().split(' ')[0]),
                  if (product.ingredients.isNotEmpty)
                    buildRow('Ingredients:', product.ingredients),
                  if (product.careInstructions.isNotEmpty)
                    buildRow('Care Instructions:', product.careInstructions),
                ],
              ),
            ])
      ],
    );
  }
}
