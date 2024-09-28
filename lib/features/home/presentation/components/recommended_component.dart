import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/basic_components/authentication_checker_component.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
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
          child: SizedBox(
              height: AppValues.sizeHeight * 240,
              child: BlocBuilder<RecommendationBloc, RecommendationState>(
                builder: (context, state) {
                  if (state is RecommendationError) {
                    return DefaultErrorMessage(
                      message: state.message,
                    );
                  } else if (state is RecommendationLoaded ||
                      state is RecommendationLoading) {
                    return DefaultSimmerLoading(
                      loading: state is RecommendationLoading,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(
                            left: AppValues.paddingWidth * 10,
                            right: AppValues.paddingWidth * 10,
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: AppValues.sizeWidth * 10,
                              ),
                          itemCount: state is RecommendationLoaded
                              ? state.products.length
                              : 4,
                          itemBuilder: (context, index) => SizedBox(
                              width: AppValues.sizeWidth * 180,
                              child: ProductCard(
                                product: state is RecommendationLoaded
                                    ? state.products[index]
                                    : null,
                              ))),
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
