import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'app_localizations.dart';

class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
   // SfGlobalLocalizations.delegate
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
