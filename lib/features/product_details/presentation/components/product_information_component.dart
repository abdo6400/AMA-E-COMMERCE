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
        // if (product.sizes.isNotEmpty)
        //   SizesComponent(
        //     sizes: product.sizes,
        //   ),
        // SizedBox(height: AppValues.sizeHeight * 10),
        // if (product.colors.isNotEmpty) ColorsComponent(colors: product.colors),
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
                children: product.extraInformation
                    .map((e) => buildRow(e.title, e.description))
                    .toList(),
              ),
            ])
      ],
    );
  }
}
