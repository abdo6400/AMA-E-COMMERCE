
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
        if (state is AdsError) {
          return DefaultErrorMessage(
            message: state.message,
          );
        } else if (state is AdsLoaded || state is AdsLoading) {
          return DefaultSimmerLoading(
            loading: state is AdsLoading,
            child: EcommerceComponents.slideShow(
              height: AppValues.sizeHeight * 100,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
