import 'package:ama/config/routes/route_observer.dart';
import 'package:ama/features/home/data/datasources/home_remote_data_source.dart';
import 'package:ama/features/home/data/repositories/home_repository_impl.dart';
import 'package:ama/features/home/domain/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../config/database/api/api_consumer.dart';
import '../config/database/api/app_interceptors.dart';
import '../config/database/api/dio_consumer.dart';
import '../config/database/cache/cache_consumer.dart';
import '../config/database/cache/secure_cache_helper.dart';
import '../config/database/network/netwok_info.dart';
import '../core/bloc/bloc_observer.dart';
import '../features/authentication/data/datasources/forget_password_renote_data_source.dart';
import '../features/authentication/data/datasources/login_remote_data_source.dart';
import '../features/authentication/data/datasources/register_remote_data_source.dart';
import '../features/authentication/data/repositories/forget_password_repository_impl.dart';
import '../features/authentication/data/repositories/login_repository_impl.dart';
import '../features/authentication/data/repositories/register_repository_impl.dart';
import '../features/authentication/domain/repositories/forget_password_repository.dart';
import '../features/authentication/domain/repositories/login_repository.dart';
import '../features/authentication/domain/repositories/register_repository.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_password_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_resend_code_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/forget_verify_email_usecase.dart';
import '../features/authentication/domain/usecases/forget_password_usecases/reset_password_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_usecase.dart';
import '../features/authentication/domain/usecases/login_usecases/login_with_google_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/check_email_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/register_with_google.dart';
import '../features/authentication/domain/usecases/register_usecases/resend_code_usecase.dart';
import '../features/authentication/domain/usecases/register_usecases/verfiy_email_usecase.dart';
import '../features/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../features/authentication/presentation/bloc/login/login_bloc.dart';
import '../features/authentication/presentation/bloc/register/register_bloc.dart';
import '../features/authentication/presentation/bloc/timer/timer_cubit.dart';
import '../features/home/domain/usecases/get_ads_usecase.dart';
import '../features/home/domain/usecases/get_best_selling_products_usecase.dart';
import '../features/home/domain/usecases/get_categories_usecase.dart';
import '../features/home/domain/usecases/get_offers_usecase.dart';
import '../features/home/presentation/bloc/ads_bloc/ads_bloc.dart';
import '../features/home/presentation/bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';
import '../features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../features/home/presentation/bloc/offers_bloc/offers_bloc.dart';
import '../features/wishlist/data/datasources/wishlist_remote_data_source.dart';
import '../features/wishlist/data/repositories/wishlist_repository_impl.dart';
import '../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../features/wishlist/domain/usecases/add_product_to_wishlist_usecase.dart';
import '../features/wishlist/domain/usecases/get_wishlist_products_usecase.dart';
import '../features/wishlist/domain/usecases/remove_product_from_wishlist_usecase.dart';
import '../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '/core/bloc/global_cubit/locale_cubit.dart';
import '/core/bloc/global_cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> serviceLocatorInit() async {
  await _authInit();
  await _app();
  // basics services //
  const sharedPreferences = FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      wOptions: WindowsOptions(useBackwardCompatibility: true));
  sl.registerLazySingleton<RouteLogger>(() => RouteLogger());
  Bloc.observer = MyBlocObserver();
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
}

Future<void> _app() async {
  //! Blocs or cubits
  sl.registerLazySingleton(() => BestSellingProductsBloc(sl()));
  sl.registerLazySingleton(() => CategoriesBloc(sl())); // Add CategoriesBloc
  sl.registerLazySingleton(() => OffersBloc(sl())); // Add OffersBloc
  sl.registerLazySingleton(() => AdsBloc(sl())); // Add AdsBloc

  sl.registerLazySingleton(() => WishlistBloc(
        getWishlistProductsUseCase: sl(),
        addProductToWishlistUseCase: sl(),
        removeProductFromWishlistUseCase: sl(),
      )); // Add WishlistBloc

  //! Use cases
  sl.registerLazySingleton(() => GetBestSellingProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetOffersUseCase(sl()));
  sl.registerLazySingleton(() => GetAdsUseCase(sl()));

  sl.registerLazySingleton(() => GetWishlistProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => RemoveProductFromWishlistUseCase(sl()));

  //! Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: sl(),
      ));

  sl.registerLazySingleton<WishlistRepository>(() => WishlistRepositoryImpl(
        remoteDataSource: sl(),
      ));

  //! Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<WishlistRemoteDataSource>(
      () => WishlistRemoteDataSourceImpl(apiConsumer: sl()));
}

Future<void> _authInit() async {
  //! Blocs or cubits
  sl.registerLazySingleton(() => LoginBloc(sl()));
  sl.registerLazySingleton(() => WorkoutCubit());
  sl.registerLazySingleton(() => RegisterBloc(sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => ForgetPasswordBloc(sl(), sl(), sl(), sl()));
  //! Use cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ResetPasswordUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => CheckEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => VerfiyEmailUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => ResendCodeUseCase(registerRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordVerifyEmailUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(
      () => ForgetPasswordResendCodeUseCase(forgetPasswordRepository: sl()));
  sl.registerLazySingleton(() => LoginWithGoogleUseCase(loginRepository: sl()));
  sl.registerLazySingleton(
      () => RegisterWithGoogleUseCase(registerRepository: sl()));
  //! repositories
  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositoryImpl(forgetPasswordRemoteDataSource: sl()));
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl()));
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerRemoteDataSource: sl()));
  //! Data sources
  sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
      () => ForgetPasswordRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(apiConsumer: sl()));
}
