import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/basic_components/authentication_checker_component.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/database/api/end_points.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/recommendation_bloc/recommendation_bloc.dart';

class RecommendedComponent extends StatelessWidget {
  const RecommendedComponent({super.key});

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
                AppStrings.recomendedForYou.tr(context),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              InkWell(
                onTap: () => context.navigateTo(
                    screenRoute: Routes.recommendedProductsRoute,
                    arg: context.read<RecommendationBloc>()),
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
        AuthenticationCheckerComponent(
          child: 
          SizedBox(
              height: AppValues.sizeHeight * 220,
              child: BlocBuilder<RecommendationBloc, RecommendationState>(
                builder: (context, state) {
                  if (state is RecommendationLoading) {
                    return const DefaultSimmerLoading(
                        type: SimmerLoadingType.grid);
                  } else if (state is RecommendationError) {
                    return DefaultErrorMessage(
                      message: state.message,
                    );
                  } else if (state is RecommendationLoaded) {
                    return ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                        left: AppValues.paddingWidth * 10,
                        right: AppValues.paddingWidth * 10,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: AppValues.sizeWidth * 10,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) => SizedBox(
                        width: AppValues.sizeWidth * 180,
                        child: EcommerceComponents.productCard(
                          onTap: () => context.navigateTo(
                            screenRoute: Routes.productDetailsRoute,
                            arg: state.products[index].id,
                          ),
                          context: context,
                          imageUrl:
                              "${EndPoints.images}${state.products[index].images.first}",
                          rating: state.products[index].rating,
                          productName: state.products[index].title,
                          isAvailable: state.products[index].stock > 0,
                          price: state.products[index].price,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )),
        ),
      ],
    );
  }
}
