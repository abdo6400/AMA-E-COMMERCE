import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../utils/app_values.dart';

class DefaultErrorMessage extends StatelessWidget {
  final String message;
  final Function? onTryAgain;
  const DefaultErrorMessage(
      {super.key, required this.message, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.someThingWentWrong.tr(context),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(width: AppValues.sizeWidth * 10),
              Icon(
                Icons.error_outline,
                size: AppValues.font * 20,
                color: Theme.of(context).colorScheme.error,
              ),
            ],
          ),
          SizedBox(height: AppValues.sizeHeight * 10),
          Text(
            message.translateWithNullSafetyString(context) ?? message,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: AppValues.sizeHeight * 10),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppValues.radius * 10),
                  side: BorderSide(color: Theme.of(context).hintColor)),
            ),
            onPressed: () {
              if (onTryAgain != null) onTryAgain!();
            },
            child: Text(
              AppStrings.tryAgain.tr(context),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}
