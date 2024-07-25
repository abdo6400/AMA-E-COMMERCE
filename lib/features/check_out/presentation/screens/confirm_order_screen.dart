import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../components/confirm_order_component/order_location_details_component.dart';
import '../components/confirm_order_component/order_payment_details_component.dart';
import '../components/confirm_order_component/order_poyment_method_component.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 15,
          vertical: AppValues.paddingHeight * 5),
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppValues.sizeHeight * 10),
              Row(
                children: [
                  const Icon(
                    Icons.list,
                    color: AppColors.greenDark,
                  ),
                  SizedBox(width: AppValues.sizeWidth * 10),
                  Text(
                    AppStrings.myOrder.tr(context),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              SizedBox(height: AppValues.sizeHeight * 10),
              Text(
                AppStrings.orderReviewSub.tr(context),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: AppValues.sizeHeight * 20),
              const OrderPoymentMethodComponent(),
              SizedBox(height: AppValues.sizeHeight * 20),
              const OrderPaymentDetailsComponent(),
              SizedBox(height: AppValues.sizeHeight * 20),
              const OrderLocationDetailsComponent(),
            ]),
      ),
    );
  }
}
