import 'package:ama/core/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/ads_bloc/ads_bloc.dart';

class AdsComponent extends StatelessWidget {
  const AdsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsState>(
      builder: (context, state) {
        if (state is AdsLoading) {
          return const DefaultSimmerLoading(
            type: SimmerLoadingType.card,
          );
        } else if (state is AdsError) {
          return DefaultErrorMessage(
            message: state.message,
          );
        } else if (state is AdsLoaded) {
          return EcommerceComponents.slideShow(
            height: AppValues.sizeHeight * 100,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
