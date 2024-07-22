import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
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
                    AppStrings.cart.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: AppValues.sizeHeight * 5),
                  const Divider(),
                  SizedBox(height: AppValues.sizeHeight * 5),
                  Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.only(
                            bottom: AppValues.paddingHeight * 50),
                        separatorBuilder: (context, index) => SizedBox(
                              height: AppValues.sizeHeight * 10,
                            ),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CartItem(
                            name: 'Graphic T-shirt',
                            category: "clothing",
                            price: 12.99,
                            quantity: 4,
                            imageUrl:
                                'https://picsum.photos/1260/760?random=$index',
                            onAdd: () => {},
                            onRemove: () => {},
                          );
                        }),
                  ),
                ]),
          ),
        ),
        SizedBox(
          width: AppValues.screenWidth,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppValues.radius * 50),
                  topRight: Radius.circular(AppValues.radius * 50)),
            ),
            color: Theme.of(context).hintColor.withOpacity(0.05),
            margin: EdgeInsets.only(bottom: AppValues.marginHeight * 50),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppValues.paddingHeight * 10,
                  horizontal: AppValues.paddingWidth * 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppStrings.subTotalAmount.tr(context)} :",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "500 \$",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.sizeHeight * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppStrings.deliveryFees.tr(context)} :",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "500 \$",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.sizeHeight * 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppStrings.totalAmount.tr(context)} :",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "1000 \$",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: AppValues.sizeHeight * 10),
                  DefaultButton(
                      width: AppValues.screenWidth ,
                      elevation: 0.5,
                      radius: AppValues.radius * 10,
                      onPressed: () => context.navigateTo(screenRoute: Routes.checkOutRoute),
                      textColor: Theme.of(context).scaffoldBackgroundColor,
                      text: AppStrings.checkOut),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
