import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/bloc/global_cubit/locale_cubit.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.languages.tr(context)),
            elevation: 1,
            centerTitle: true,
          ),
          body: ListView(
            children: [
              CheckboxListTile(
                  title: Text(AppStrings.english.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium),
                  value: AppLocalizations.of(context)!
                          .locale
                          .languageCode
                          .toLowerCase() ==
                      'en',
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 50)),
                  onChanged: (_) {
                    context.read<LocaleCubit>().toEnglish();
                  }),
              CheckboxListTile(
                  title: Text(AppStrings.arabic.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium),
                  value: AppLocalizations.of(context)!
                          .locale
                          .languageCode
                          .toLowerCase() ==
                      'ar',
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 50)),
                  onChanged: (_) {
                    context.read<LocaleCubit>().toArabic();
                  })
            ],
          )),
    );
  }
}
