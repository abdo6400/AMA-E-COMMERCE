import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/basic_components/authentication_checker_component.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cart_bloc.dart';
import '../components/cart_product_listview_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationCheckerComponent(
      child: CustomInternetConnectionChecker(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const DefaultSimmerLoading(
                type: SimmerLoadingType.list,
                scrollDirection: Axis.vertical,
              );
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth * 15,
                            vertical: AppValues.paddingHeight * 5),
                        child: CartProductListviewComponent(
                          products: state.products,
                        )),
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
                      margin:
                          EdgeInsets.only(bottom: AppValues.marginHeight * 50),
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
                                  "${state.totalQuantity.toStringAsFixed(2)} \$",
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
                            SizedBox(height: AppValues.sizeHeight * 10),
                            DefaultButton(
                                width: AppValues.screenWidth,
                                elevation: 0.5,
                                radius: AppValues.radius * 10,
                                onPressed: () => context.navigateTo(
                                    screenRoute: Routes.checkOutRoute,
                                    arg: state.products),
                                text: AppStrings.checkOut,
                                child: Text(
                                  "${(state.totalQuantity + 500).toStringAsFixed(2)} \$",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: AppColors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else if (state is CartError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
