import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/cubits/payment_cubit.dart';

class CashCardComponent extends StatelessWidget {

  const CashCardComponent({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.orPaywithCash.tr(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Checkbox(value: context.watch<PaymentCubit>().state == AppStrings.cash, onChanged: (_) => context.read<PaymentCubit>().changePaymentType(AppStrings.cash)),
          ],
        ),
        SizedBox(height: AppValues.sizeHeight * 10),
        Image(
          image: const AssetImage(AppImages.onBoardingBackground1),
          height: AppValues.sizeHeight * 150,
        )
      ],
    );
  }
}
