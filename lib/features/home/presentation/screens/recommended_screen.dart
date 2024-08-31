import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/recommendation_bloc/recommendation_bloc.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.recomendedForYou.tr(context)),
        elevation: 1,
      ),
      body: CustomInternetConnectionChecker(
          child: BlocProvider.value(
        value: ModalRoute.of(context)?.settings.arguments as RecommendationBloc,
        child: BlocBuilder<RecommendationBloc, RecommendationState>(
          builder: (context, state) {
            if (state is RecommendationLoaded) {
              return const DefaultSimmerLoading(type: SimmerLoadingType.grid);
            } else if (state is RecommendationError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            } else if (state is RecommendationLoaded) {
              return GridView.builder(
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
                itemCount: state.products.length,
                itemBuilder: (context, index) =>
                    EcommerceComponents.productCard(
                  onTap: () => context.navigateTo(
                    screenRoute: Routes.productDetailsRoute,
                    arg: state.products[index].id,
                  ),
                  context: context,
                   imageUrl: state.products[index].images.first,
                      rating: state.products[index].rating,
                      productName: state.products[index].title,
                      isAvailable: state.products[index].stock > 0,
                  price: state.products[index].price,
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      )),
    );
  }
}
