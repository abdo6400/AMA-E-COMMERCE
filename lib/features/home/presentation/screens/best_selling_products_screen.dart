import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';

class BestSellingProductsScreen extends StatelessWidget {
  const BestSellingProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.bestSeller.tr(context)),
        elevation: 1,
      ),
      body: CustomInternetConnectionChecker(
          child: BlocProvider.value(
        value: ModalRoute.of(context)?.settings.arguments
            as BestSellingProductsBloc,
        child: BlocBuilder<BestSellingProductsBloc, BestSellingProductsState>(
          builder: (context, state) {
            if (state is BestSellingProductsError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            } else if (state is BestSellingProductsLoaded ||
                state is BestSellingProductsLoading) {
              return DefaultSimmerLoading(
                loading: state is BestSellingProductsLoading,
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(
                      left: AppValues.paddingWidth * 10,
                      right: AppValues.paddingWidth * 10,
                      top: AppValues.paddingHeight * 20,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: AppValues.sizeHeight * 10,
                      crossAxisSpacing: AppValues.sizeWidth * 10,
                      crossAxisCount: 2,
                      mainAxisExtent: AppValues.sizeHeight * 240,
                    ),
                    itemCount: state is BestSellingProductsLoaded
                        ? state.products.length
                        : 4,
                    itemBuilder: (context, index) => ProductCard(
                          product: state is BestSellingProductsLoaded
                              ? state.products[index]
                              : null,
                        )),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      )),
    );
  }
}
