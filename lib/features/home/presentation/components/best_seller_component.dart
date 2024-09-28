import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/components/default_components/default_error_message.dart';
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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              InkWell(
                onTap: () => context.navigateTo(
                    screenRoute: Routes.bestSellingProductsRoute,
                    arg: context.read<BestSellingProductsBloc>()),
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
            height: AppValues.sizeHeight * 270,
            child:
                BlocBuilder<BestSellingProductsBloc, BestSellingProductsState>(
              builder: (context, state) {
                if (state is BestSellingProductsError) {
                  return DefaultErrorMessage(
                    message: state.message,
                  );
                } else if (state is BestSellingProductsLoaded ||
                    state is BestSellingProductsLoading) {
                  return DefaultSimmerLoading(
                    loading: state is BestSellingProductsLoading,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          left: AppValues.paddingWidth * 10,
                          right: AppValues.paddingWidth * 10,
                          bottom: AppValues.paddingHeight * 40),
                      separatorBuilder: (context, index) => SizedBox(
                        width: AppValues.sizeWidth * 10,
                      ),
                      itemCount: state is BestSellingProductsLoaded
                          ? state.products.length
                          : 5,
                      itemBuilder: (context, index) => SizedBox(
                          width: AppValues.sizeWidth * 180,
                          child: ProductCard(
                            product: state is BestSellingProductsLoaded
                                ? state.products[index]
                                : null,
                          )),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )),
        SizedBox(height: AppValues.sizeHeight * 30),
      ],
    );
  }
}
