import 'package:ama/core/components/basic_components/starting_components/onboarding_screen.dart';
import 'package:ama/core/components/basic_components/starting_components/splash_screen.dart';
import 'package:ama/features/ama_chat/presentation/screens/ama_chat_screen.dart';
import 'package:ama/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ama/features/check_out/presentation/bloc/cubit/controller_screens_cubit.dart';
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
import '../../features/authentication/presentation/bloc/cubit/information_cubit.dart';
import '../../features/authentication/presentation/bloc/forget_password/forget_password_bloc.dart';
import '../../features/authentication/presentation/bloc/login/login_bloc.dart';
import '../../features/authentication/presentation/bloc/register/register_bloc.dart';
import '../../features/authentication/presentation/bloc/timer/timer_cubit.dart';
import '../../features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/otp_forget_password_screen.dart';
import '../../features/authentication/presentation/screens/forget_password/reset_password_screen.dart';
import '../../features/authentication/presentation/screens/login/login_screen.dart';
import '../../features/authentication/presentation/screens/register/otp_screen.dart';
import '../../features/authentication/presentation/screens/register/register_screen.dart';
import '../../features/authentication/presentation/screens/register/user_information_screen.dart';
import '../../features/check_out/presentation/screens/check_out_screen.dart';
import '../../features/home/presentation/bloc/ads_bloc/ads_bloc.dart';
import '../../features/home/presentation/bloc/best_prodcuts_bloc/best_selling_products_bloc.dart';
import '../../features/home/presentation/bloc/categories_bloc/categories_bloc.dart';
import '../../features/home/presentation/bloc/offers_bloc/offers_bloc.dart';
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
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<LoginBloc>()),
                BlocProvider.value(value: InformationCubit())
              ],
              child: const LoginScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.registerRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const RegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.informationRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const UserInformationScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpRegisterRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<RegisterBloc>()),
                BlocProvider.value(value: WorkoutCubit()..startWorkout()),
              ],
              child: const OtpRegisterScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.otpForgetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
                BlocProvider.value(value: WorkoutCubit()..startWorkout()),
              ],
              child: const OtpForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.forgetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
              ],
              child: const ForgetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.resetPasswordRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: sl<ForgetPasswordBloc>()),
                BlocProvider.value(value: InformationCubit()),
              ],
              child: const ResetPasswordScreen(),
            ),
            type: PageTransitionType.leftToRightWithFade,
            settings: routeSettings);
      case Routes.mainRoute:
        return PageTransition(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => sl<BestSellingProductsBloc>()
                    ..add(FetchBestSellingProductsEvent()),
                ),
                BlocProvider(
                    create: (_) =>
                        sl<WishlistBloc>()..add(GetWishlistProductsEvent())),
                BlocProvider(
                  create: (_) =>
                      sl<CategoriesBloc>()..add(FetchCategoriesEvent()),
                ),
                BlocProvider(
                  create: (_) => sl<OffersBloc>()..add(FetchOffersEvent()),
                ),
                BlocProvider(
                  create: (_) => sl<AdsBloc>()..add(FetchAdsEvent()),
                ),
                BlocProvider(
                  create: (_) => sl<CartBloc>()..add(GetCartProductsEvent()),
                ),
              ],
              child: const MainScreen(),
            ),
            type: PageTransitionType.fade,
            settings: routeSettings);
      case Routes.checkOutRoute:
        return PageTransition(
            child: BlocProvider(
              create: (context) => ControllerScreensCubit(),
              child: const CheckOutScreen(),
            ),
            type: PageTransitionType.bottomToTop,
            settings: routeSettings);
      case Routes.productDetailsRoute:
        return PageTransition(
            child: BlocProvider(
              create: (context) => sl<ProductDetailsBloc>()
                ..add(FetchProductDetailsEvent(routeSettings.arguments as int)),
              child: const ProductDetailsScreen(),
            ),
            type: PageTransitionType.fade,
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
