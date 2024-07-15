
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../config/database/api/api_consumer.dart';
import '../config/database/api/app_interceptors.dart';
import '../config/database/api/dio_consumer.dart';
import '../config/database/cache/cache_consumer.dart';
import '../config/database/cache/secure_cache_helper.dart';
import '../config/database/network/netwok_info.dart';

import '/core/bloc/global_cubit/locale_cubit.dart';
import '/core/bloc/global_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  await _authInit();
  await _app();
  //External
  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //       encryptedSharedPreferences: true,
  //     );
  const sharedPreferences = FlutterSecureStorage(
      // aOptions: _getAndroidOptions(),
      wOptions: WindowsOptions(useBackwardCompatibility: true));

  sl.registerLazySingleton<CacheConsumer>(
      () => SecureCacheHelper(sharedPref: sharedPreferences));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  sl.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: sl(), networkInfo: sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true));
  sl.registerLazySingleton(() => AppIntercepters(
        client: sl(),
      ));
  //google maps tools
  // sl.registerLazySingleton(() => GoogleMapsTools());
}

Future<void> _app() async {
  //! Blocs or cubits
 
  //! Use cases
 
  //! repositories
 
  //! Data sources
  
}

Future<void> _authInit() async {
  //! Blocs or cubits

  //! Use cases

  //! repositories

  //! Data sources
}
