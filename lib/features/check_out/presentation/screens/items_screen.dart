import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../../../cart/domain/entities/cart_product.dart';
import '../components/item_component.dart';
import '../components/items_components/amount_component.dart';

class ItemsScreen extends StatelessWidget {
  final List<CartProduct> items;
  const ItemsScreen({super.key, required this.items});

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
            Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.receipt),
                  SizedBox(width: AppValues.sizeWidth * 10),
                  Text(
                    AppStrings.orderReview.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ]),
            SizedBox(height: AppValues.sizeHeight * 10),
            Expanded(
              child: ListView.separated(
                  padding:
                      EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
                  separatorBuilder: (context, index) => SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ItemComponent(
                      title: items[index].name,
                      price: items[index].price,
                      quantity: items[index].quantity,
                      imageUrl: items[index].image,
                    );
                  }),
            ),
            SizedBox(height: AppValues.sizeHeight * 10),
            AmountComponent(
                subTotalAmount:
                    items.sumByDouble((x) => (x.price * x.quantity))),
          ]),
    );
  }
}
