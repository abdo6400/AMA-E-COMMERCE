import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/app_enums.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';

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
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
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
        SizedBox(height: AppValues.sizeHeight * 20),
        SizedBox(
            height: AppValues.sizeHeight * 500,
            child: CustomInternetConnectionChecker(child:
                BlocBuilder<BestSellingProductsBloc, BestSellingProductsState>(
              builder: (context, state) {
                if (state is BestSellingProductsLoading) {
                  return const DefaultSimmerLoading(
                      type: SimmerLoadingType.grid);
                } else if (state is BestSellingProductsError) {
                  return DefaultErrorMessage(
                    message: state.message,
                  );
                } else if (state is BestSellingProductsLoaded) {
                  return GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      left: AppValues.paddingWidth * 10,
                      right: AppValues.paddingWidth * 10,
                      bottom: AppValues.paddingHeight * 10,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: AppValues.sizeHeight * 10,
                      crossAxisSpacing: AppValues.sizeWidth * 10,
                      crossAxisCount: 2,
                      mainAxisExtent: AppValues.sizeHeight * 160,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) =>
                        EcommerceComponents.productCard(
                      onTap: () => context.navigateTo(
                        screenRoute: Routes.productDetailsRoute,
                        arg: state.products[index].id,
                      ),
                      context: context,
                      imageUrl: state.products[index].image,
                      rating: state.products[index].rating,
                      productName: state.products[index].name,
                      isAvailable: state.products[index].isAvailable,
                      price: state.products[index].price,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ))),
        SizedBox(height: AppValues.sizeHeight * 30),
      ],
    );
  }
}
