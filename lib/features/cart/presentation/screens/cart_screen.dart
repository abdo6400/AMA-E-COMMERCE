import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/alerts_extensions.dart';
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
        child: BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state.isDeleted) {
              context.showToast(AppStrings.productRemovedFromCart,
                  state: ToastStates.error);
            }
          },
          builder: (context, state) {
            if (state.hasError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            }
            return DefaultSimmerLoading(
              loading: state.isLoading,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth * 15,
                            vertical: AppValues.paddingHeight * 5),
                        child: CartProductListviewComponent(
                          products: state.hasData ? state.products : [],
                          isLoading: state.isLoading,
                        )),
                  ),
                  SizedBox(
                    width: AppValues.screenWidth,
                    child: Container(
                      color: Colors.transparent,
                      margin:
                          EdgeInsets.only(bottom: AppValues.marginHeight * 50),
                      padding: EdgeInsets.symmetric(
                          vertical: AppValues.paddingHeight * 10,
                          horizontal: AppValues.paddingWidth * 30),
                      child: DefaultButton(
                          width: AppValues.screenWidth,
                          elevation: 0.5,
                          radius: AppValues.radius * 10,
                          onPressed: () =>
                              state.hasData && state.products.isNotEmpty
                                  ? context.navigateTo(
                                      screenRoute: Routes.checkOutRoute,
                                      arg: state.hasData ? state.products : [])
                                  : null,
                          text: AppStrings.checkOut,
                          child: Text(
                            state.hasData
                                ? "${(state.totalQuantity).toStringAsFixed(2)} \$"
                                : "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                          )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
