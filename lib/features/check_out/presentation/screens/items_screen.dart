import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/item_component.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 15,
          vertical: AppValues.paddingHeight * 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppValues.sizeHeight * 10),
            Text(
              AppStrings.orderReview.tr(context),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppValues.sizeHeight * 10),
            Expanded(
              child: ListView.separated(
                  padding:
                      EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
                  separatorBuilder: (context, index) => SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ItemComponent(
                      title: 'Graphic T-shirt',
                      price: 12.99,
                      quantity: 4,
                      imageUrl: 'https://picsum.photos/1260/760?random=$index',
                    );
                  }),
            ),
          ]),
    );
  }
}
