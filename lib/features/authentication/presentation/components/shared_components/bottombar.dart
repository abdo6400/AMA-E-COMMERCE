import 'package:flutter/material.dart';
import 'package:ama/config/locale/app_localizations.dart';
import '../../../../../core/utils/app_values.dart';

class BottomBar extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final Function function;
  const BottomBar(
      {super.key,
      required this.firstTitle,
      required this.secondTitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: AppValues.paddingHeight*10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(firstTitle.tr(context),
              style: Theme.of(context).textTheme.labelLarge),
          TextButton(
            onPressed: () => function(),
            child: Text(secondTitle.tr(context),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary)),
          ),
        ],
      ),
    );
  }
}
