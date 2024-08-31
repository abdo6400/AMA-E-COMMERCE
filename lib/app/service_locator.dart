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
import '../features/cart/data/datasources/cart_remote_data_source.dart';
import '../features/cart/data/repositories/cart_repository_imp.dart';
import '../features/cart/domain/repositories/cart_repository.dart';
import '../features/cart/domain/usecases/add_product_to_cart_usecase.dart';
import '../features/cart/domain/usecases/get_cart_products_usecase.dart';
import '../features/cart/domain/usecases/remove_product_from_cart_usecase.dart';
import '../features/cart/domain/usecases/update_cart_quantity_usecase.dart';
import '../features/cart/presentation/bloc/cart_bloc.dart';
import '../features/category_details/data/datasources/category_remote_data_source.dart';
import '../features/category_details/data/repositories/category_repository_impl.dart';
import '../features/category_details/domain/repositories/category_repository.dart';
import '../features/category_details/domain/usecases/get_category_details_use_case.dart';
import '../features/category_details/presentation/bloc/category_details_bloc.dart';
import '../features/home/domain/usecases/get_ads_usecase.dart';
import '../features/home/domain/usecases/get_best_selling_products_usecase.dart';
import '../features/home/domain/usecases/get_categories_usecase.dart';
import '../features/home/domain/usecases/get_offers_usecase.dart';
import '../features/home/domain/usecases/get_recommendation_products_usecase.dart';
import '../features/home/presentation/bloc/ads_bloc/ads_bloc.dart';
import '../features/home/presentation/bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';
import '../features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../features/home/presentation/bloc/offers_bloc/offers_bloc.dart';
import '../features/home/presentation/bloc/recommendation_bloc/recommendation_bloc.dart';
import '../features/product_details/data/datasources/product_details_remote_data_source.dart';
import '../features/product_details/data/repositories/product_details_repository_impl.dart';
import '../features/product_details/domain/repositories/product_details_repository.dart';
import '../features/product_details/domain/usecases/get_product_details_usecase.dart';
import '../features/product_details/presentation/bloc/product_details_bloc.dart';
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
  sl.registerLazySingleton(() => CategoriesBloc(sl()));
  sl.registerLazySingleton(() => OffersBloc(sl()));
  sl.registerFactory(
    () => RecommendationBloc(getRecommendationProductsUseCase: sl()),
  );
  sl.registerLazySingleton(() => AdsBloc(sl()));
  sl.registerLazySingleton(() => WishlistBloc(
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory(
    () => CategoryDetailsBloc(getCategoryDetailsUseCase: sl()),
  );
  sl.registerFactory(() => ProductDetailsBloc(sl()));
  sl.registerLazySingleton(() => CartBloc(sl(), sl(), sl(), sl()));
  //! Use cases
  sl.registerLazySingleton(() => GetBestSellingProductsUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetOffersUseCase(sl()));
  sl.registerLazySingleton(() => GetAdsUseCase(sl()));
  sl.registerLazySingleton(
    () => GetRecommendationProductsUseCase(sl()),
  );
  sl.registerLazySingleton(() => GetWishlistProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductToWishlistUseCase(sl()));
  sl.registerLazySingleton(() => RemoveProductFromWishlistUseCase(sl()));

  sl.registerLazySingleton(() => GetCartProductsUseCase(sl()));
  sl.registerLazySingleton(() => AddProductToCartUseCase(sl()));
  sl.registerLazySingleton(() => RemoveProductFromCartUseCase(sl()));
  sl.registerLazySingleton(() => UpdateCartQuantityUseCase(sl()));
  sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));

  sl.registerLazySingleton(() => GetCategoryDetailsUseCase(sl()));
  //! Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
        remoteDataSource: sl(),
      ));

  sl.registerLazySingleton<WishlistRepository>(() => WishlistRepositoryImpl(
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(remoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<WishlistRemoteDataSource>(
      () => WishlistRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(
        apiConsumer: sl(),
      ));
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<CategoryRemoteDataSource>(
    () => CategoryRemoteDataSourceImpl(apiConsumer: sl()),
  );
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
