import 'package:ama/core/components/basic_components/starting_components/onboarding_screen.dart';
import 'package:ama/core/components/basic_components/starting_components/splash_screen.dart';
import 'package:ama/features/ama_chat/presentation/screens/ama_chat_screen.dart';
import 'package:ama/features/check_out/presentation/bloc/blocs/checkout_bloc/check_out_bloc.dart';
import 'package:ama/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:ama/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:ama/features/profile/presentation/screens/languages_screen.dart';
import 'package:ama/features/profile/presentation/screens/theme_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../app/service_locator.dart';
import '../../core/components/basic_components/main_screen.dart';
import '../../core/utils/app_strings.dart';
import '../../features/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../../features/authentication/presentation/bloc/login/login_bloc.dart';
import '../../features/authentication/presentation/bloc/register/register_bloc.dart';
import '../../features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/otp_forget_password_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/reset_password_screen.dart';
import '../../features/authentication/presentation/screens/login/login_screen.dart';
import '../../features/authentication/presentation/screens/register/otp_screen.dart';
import '../../features/authentication/presentation/screens/register/register_screen.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/category_details/presentation/bloc/category_details_bloc.dart';
import '../../features/category_details/presentation/screens/category_details_screen_page.dart';
import '../../features/check_out/presentation/bloc/blocs/address_bloc/address_bloc.dart';
import '../../features/check_out/presentation/screens/check_out_screen.dart';
import '../../features/home/presentation/bloc/ads_bloc/ads_bloc.dart';
import '../../features/home/presentation/bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';
import '../../features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../features/home/presentation/bloc/offers_bloc/offers_bloc.dart';
import '../../features/home/presentation/bloc/recommendation_bloc/recommendation_bloc.dart';
import '../../features/home/presentation/screens/best_selling_products_screen.dart';
import '../../features/home/presentation/screens/categories_screen.dart';
import '../../features/home/presentation/screens/offers_screen.dart';
import '../../features/home/presentation/screens/recommended_screen.dart';
import '../../features/orders/presentation/screens/orders_screen.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';

class Routes {
  //basic routes
  static const String initialRoute = '/';
  static const String themeRoute = "/themeRoute";
  static const String languagesRoute = "/languagesRoute";
  static const String amaChatRoute = "/amaChatRoute";
  static const String mapRoute = '/mapRoute';
  static const String onBoardingRoute = "/onBoardingRoute";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/registerRoute";
  static const String informationRoute = "/informationRoute";
  static const String otpRegisterRoute = "/otpRegisterRoute";
  static const String otpForgetPasswordRoute = "/otpForgetPasswordRoute";
  static const String forgetPasswordRoute = "/forgetPasswordRoute";
  static const String resetPasswordRoute = "/resetPasswordRoute";
  static const String mainRoute = "/mainRoute";
  static const String changePasswordRoute = "/changePasswordRoute";
  static const String editProfileRoute = "/editProfileRoute";
  static const String notifcationsRoute = "/notifcationsRoute";
  static const String checkOutRoute = "/checkOutRoute";
  static const String productDetailsRoute = "/productDetailsRoute";
  static const String categoriesRoute = "/categoriesRoute";
  static const String categoryDetailsScreenRoute =
      "/categoryDetailsScreenRoute";

  static const String offersRoute = "/offersRoute";
  static const String bestSellingProductsRoute = "/bestSellingProductsRoute";
  static const String subCategoriesRoute = "/subCategoriesRoute";
  static const String recommendedProductsRoute = "/recommendedProductsRoute";

  static const String orderRoute = "/orderRoute";
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return PageTransition(
            child: const SplashScreen(),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.themeRoute:
        return PageTransition(
            child: const ThemeScreen(),
            type: PageTransitionType.bottomToTop,
            settings: routeSettings);
      case Routes.amaChatRoute:
        return PageTransition(
            child: const AmaChatScreen(),
            type: PageTransitionType.topToBottom,
            settings: routeSettings);
      case Routes.languagesRoute:
        return PageTransition(
            child: const LanguagesScreen(),
            type: PageTransitionType.bottomToTop,
            settings: routeSettings);
      case Routes.onBoardingRoute:
        return PageTransition(
            child: const OnBoardingScreen(),
            type: PageTransitionType.leftToRight,
            settings: routeSettings);
      case Routes.loginRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: sl<LoginBloc>(),
              child: const LoginScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.registerRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: sl<RegisterBloc>(),
              child: const RegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpRegisterRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: (routeSettings.arguments as Map<String, dynamic>)['bloc']
                  as RegisterBloc,
              child: const OtpRegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpForgetPasswordRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: (routeSettings.arguments as Map<String, dynamic>)['bloc']
                  as ForgetPasswordBloc,
              child: const OtpForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.forgetPasswordRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: sl<ForgetPasswordBloc>(),
              child: const ForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.resetPasswordRoute:
        return PageTransition(
            child: BlocProvider.value(
              value: routeSettings.arguments as ForgetPasswordBloc,
              child: const ResetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.mainRoute:
        return PageTransition(
            child: MultiBlocProvider(providers: [
              BlocProvider.value(
                value: sl<BestSellingProductsBloc>()
                  ..add(FetchBestSellingProductsEvent()),
              ),
              BlocProvider.value(
                  value: sl<WishlistBloc>()..add(GetWishlistProductsEvent())),
              BlocProvider.value(
                value: sl<CategoriesBloc>()..add(FetchCategoriesEvent()),
              ),
              BlocProvider.value(
                value: sl<OffersBloc>()..add(FetchOffersEvent()),
              ),
              BlocProvider.value(
                value: sl<AdsBloc>()..add(FetchAdsEvent()),
              ),
              BlocProvider.value(
                value: sl<RecommendationBloc>()
                  ..add(GetRecommendationProductsEvent()),
              ),
              BlocProvider.value(
                value: sl<CartBloc>()..add(GetCartProductsEvent()),
              ),
            ], child: const MainScreen()),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.checkOutRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: sl<CheckOutBloc>(),
                ),
                BlocProvider.value(
                  value: sl<AddressBloc>()..add(const GetAddressEvent()),
                ),
                BlocProvider.value(
                  value: sl<CartBloc>(),
                ),
              ],
              child: const CheckOutScreen(),
            ),
            type: PageTransitionType.bottomToTop,
            settings: routeSettings);
      case Routes.productDetailsRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<WishlistBloc>()),
                BlocProvider.value(
                  value: sl<CartBloc>(),
                ),
                BlocProvider.value(
                    value: sl<ProductDetailsBloc>()
                      ..add(FetchProductDetailsEvent(
                          (routeSettings.arguments as Map)['id'] as int))),
              ],
              child: const ProductDetailsScreen(),
            ),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.categoriesRoute:
        return PageTransition(
            child: const CategoriesScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.bestSellingProductsRoute:
        return PageTransition(
            child: const BestSellingProductsScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.offersRoute:
        return PageTransition(
            child: const OffersScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.recommendedProductsRoute:
        return PageTransition(
            child: const RecommendedScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.categoryDetailsScreenRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<WishlistBloc>()),
                BlocProvider.value(
                  value: sl<CategoryDetailsBloc>()
                    ..add(GetCategoryDetailsEvent(
                        id: routeSettings.arguments as int)),
                )
              ],
              child: const CategoryDetailsScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);

      case Routes.orderRoute:
        return PageTransition(
            child: const OrdersScreen(),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
