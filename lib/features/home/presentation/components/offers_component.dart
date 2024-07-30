import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

import '../bloc/offers_bloc/offers_bloc.dart';

class OffersComponent extends StatelessWidget {
  const OffersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.bestOffers.tr(context),
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
        SizedBox(height: AppValues.sizeHeight * 15),
        BlocBuilder<OffersBloc, OffersState>(
          builder: (context, state) { 
            if (state is OffersLoading) {
              return DefaultSimmerLoading(
                type: SimmerLoadingType.card,
                width: AppValues.screenWidth * 0.8,
                height: AppValues.sizeHeight * 150,
              );
            } else if (state is OffersError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is OffersLoaded) {
              return EcommerceComponents.slider();
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
