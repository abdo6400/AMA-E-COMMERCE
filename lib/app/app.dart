import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../config/locale/app_localizations_setup.dart';
import '../config/routes/app_routes.dart';
import '../config/routes/route_observer.dart';
import '../config/themes/app_theme.dart';
import '../core/bloc/global_cubit/locale_cubit.dart';
import '../core/bloc/global_cubit/theme_cubit.dart';
import '../core/utils/app_strings.dart';
import '../core/utils/app_values.dart';
import 'service_locator.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:path/path.dart' as path;

class UserApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
    ));

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<LocaleCubit>()..getSavedLang()),
          BlocProvider(create: (context) => sl<ThemeCubit>()..getThemeMode()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, mode) {
            return BlocBuilder<LocaleCubit, LocaleState>(
                buildWhen: (previousState, currentState) {
              return previousState != currentState;
            }, builder: (context, state) {
              return GlobalLoaderOverlay(
                child: DevicePreview(
                  enabled: true,
                  tools: [
                    ...DevicePreview.defaultTools,
                    DevicePreviewScreenshot(
                        onScreenshot: (context, image) async {
                      try {
                        // Get the bytes and format of the image
                        final bytes = image.bytes;

                        final directoryPath =
                            'D:\\Custom_Projects\\ama\\screenshots';
                        final screenshotsDir = Directory(directoryPath);
                        // Get a list of existing screenshot files
                        final existingFiles = screenshotsDir
                            .listSync()
                            .where((file) =>
                                file is File && file.path.endsWith('.png'))
                            .map((file) =>
                                path.basenameWithoutExtension(file.path))
                            .toList();
                        print('existingFiles: $existingFiles');
                        // Find the next available number from 1 to 1000
                        int nextNumber = 1;
                        while (existingFiles.contains('$nextNumber') &&
                            nextNumber <= 20) {
                          nextNumber++;
                        }

                        if (nextNumber > 20) {
                          print('Screenshot limit reached');
                          return;
                        }

                        // Generate the file path with the next available number
                        final filePath =
                            path.join(screenshotsDir.path, '$nextNumber.png');

                        // Save the image to the file
                        final file = File(filePath);
                        await file.writeAsBytes(bytes);

                        print('Screenshot saved to $filePath');
                      } catch (e) {
                        print('Error saving screenshot: $e');
                      }
                    }),
                  ],
                  availableLocales:
                      AppLocalizationsSetup.supportedLocales.toList(),
                  builder: (context) => ScreenUtilInit(
                      ensureScreenSize: true,
                      designSize: AppValues.getPlatformSize(),
                      minTextAdapt: true,
                      splitScreenMode: true,
                      useInheritedMediaQuery: true,
                      builder: (context, _) {
                        ScreenUtil.configure(
                          data: MediaQuery.of(context),
                        );
                        return MaterialApp(
                          title: AppStrings.appName,
                          builder: DevicePreview.appBuilder,
                          debugShowCheckedModeBanner: false,
                          themeMode: mode.themeMode,
                          theme: AppTheme.getApplicationLightTheme(),
                          darkTheme: AppTheme.getApplicationDarkTheme(),
                          navigatorKey: UserApp.navigatorKey,
                          onGenerateRoute: AppRoutes.onGenerateRoute,
                          locale: state.locale,
                          navigatorObservers: [sl<RouteLogger>()],
                          supportedLocales:
                              AppLocalizationsSetup.supportedLocales,
                          localeResolutionCallback:
                              AppLocalizationsSetup.localeResolutionCallback,
                          localizationsDelegates:
                              AppLocalizationsSetup.localizationsDelegates,
                        );
                      }),
                ),
              );
            });
          },
        ));
  }
}

//./gradlew signingReport