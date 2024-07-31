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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: AppValues.font * 50,
              color: Theme.of(context).colorScheme.error,
            ),
            SizedBox(height: AppValues.sizeHeight * 10),
            Text(
              AppStrings.someThingWentWrong.tr(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: AppValues.sizeHeight * 10),
            Text(
              message.translateWithNullSafetyString(context) ?? message,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: AppValues.sizeHeight * 10),
            ElevatedButton(
              onPressed: () {
                if (onTryAgain != null) onTryAgain!();
              },
              child: Text(AppStrings.tryAgain.tr(context)),
            ),
          ],
        ),
      ),
    );
  }
}
