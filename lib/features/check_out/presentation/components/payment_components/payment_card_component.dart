import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class PaymentCardComponent extends StatelessWidget {
  final bool isSelected;
  final bool isChosen;
  const PaymentCardComponent(
      {super.key, required this.isSelected, this.isChosen = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.orPaywithCard.tr(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (!isChosen) Checkbox(value: isSelected, onChanged: (_) {}),
          ],
        ),
        SizedBox(height: AppValues.sizeHeight * 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppValues.radius * 10)),
                      color: AppColors.blueLight),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const CircleAvatar(
                            backgroundColor: AppColors.greenDark,
                            child: Icon(
                              Icons.check,
                              color: AppColors.nearlyWhite,
                            ),
                          ),
                          Text(
                            AppStrings.visa.tr(context),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: AppColors.nearlyWhite),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                      Text(
                        "**** **** **** 4567",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.nearlyWhite),
                      ),
                      SizedBox(
                        height: AppValues.sizeHeight * 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                //AppStrings.cardHolder.tr(context),
                                "CARD HOLDER",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontSize: AppValues.font * 15),
                              ),
                              SizedBox(
                                height: AppValues.sizeHeight * 5,
                              ),
                              Text(
                                "AMAMystro",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.nearlyWhite,
                                        fontSize: AppValues.font * 15),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                //  AppStrings.expires.tr(context),
                                "EXPIRES",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontSize: AppValues.font * 15),
                              ),
                              SizedBox(
                                height: AppValues.sizeHeight * 5,
                              ),
                              Text(
                                "8/22",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.nearlyWhite,
                                        fontSize: AppValues.font * 15),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                //  AppStrings.cvv.tr(context),
                                "CVV",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: AppColors.grey,
                                        fontSize: AppValues.font * 15),
                              ),
                              SizedBox(
                                height: AppValues.sizeHeight * 5,
                              ),
                              Text(
                                "842",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: AppColors.nearlyWhite,
                                        fontSize: AppValues.font * 15),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
