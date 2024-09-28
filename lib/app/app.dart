import 'dart:io';
import 'package:ama/core/components/cubits/auth_check_cubit/auth_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../config/locale/app_localizations_setup.dart';
import '../config/routes/app_routes.dart';
import '../config/intercepters/route_intercepter.dart';
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
          BlocProvider(create: (context) => sl<AuthCheckCubit>()..checkAuthentication()),       
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, mode) {
            return BlocBuilder<LocaleCubit, LocaleState>(
                buildWhen: (previousState, currentState) {
              return previousState != currentState;
            }, builder: (context, state) {
              return GlobalLoaderOverlay(
                child: DevicePreview(
                  enabled: !Platform.isAndroid,
                  tools: [
                    ...DevicePreview.defaultTools,
                    DevicePreviewScreenshot(
                        onScreenshot: (context, image) async {
                      try {
                        final bytes = image.bytes;
                        const directoryPath =
                            'D:\\Custom_Projects\\ama\\screenshots';
                        final screenshotsDir = Directory(directoryPath);
                        final existingFiles = screenshotsDir
                            .listSync()
                            .where((file) =>
                                file is File && file.path.endsWith('.png'))
                            .map((file) =>
                                path.basenameWithoutExtension(file.path))
                            .toList();
                        int nextNumber = 1;
                        while (existingFiles.contains('$nextNumber') &&
                            nextNumber <= 20) {
                          nextNumber++;
                        }
                        if (nextNumber > 20) {
                          return;
                        }
                        final filePath =
                            path.join(screenshotsDir.path, '$nextNumber.png');
                        final file = File(filePath);
                        await file.writeAsBytes(bytes);
                      } catch (e) {}
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
                          navigatorObservers: [sl<RouteIntercepter>()],
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