import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
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
            if (state is RecommendationError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            } else if (state is RecommendationLoaded ||
                state is RecommendationLoading) {
              return DefaultSimmerLoading(
                loading: state is RecommendationLoading,
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
                    itemCount: state is RecommendationLoaded
                        ? state.products.length
                        : 4,
                    itemBuilder: (context, index) => ProductCard(
                          product: state is RecommendationLoaded
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
