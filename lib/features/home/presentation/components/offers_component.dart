import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              InkWell(
                onTap: () => context.navigateTo(
                    screenRoute: Routes.offersRoute,
                    arg: context.read<OffersBloc>()),
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
            if (state is OffersError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            } else if (state is OffersLoaded || state is OffersLoading) {
              return DefaultSimmerLoading(
                  loading: state is OffersLoading,
                  child: EcommerceComponents.slider());
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}
