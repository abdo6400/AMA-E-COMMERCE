import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/login/login_bloc.dart';
import '../../components/login_components/login_input_section.dart';
import '../../components/shared_components/bottombar.dart';
import '../../components/shared_components/topbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          context.closeKeyboard();
          context.loaderOverlay.show();
        } else if (state is LoginErrorState) {
          context.loaderOverlay.hide();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              autoCloseDuration: Durations.extralong4,
              showConfirmBtn: false,
              width: AppValues.screenWidth / 4,
              title: AppStrings.someThingWentWrong.tr(context));
        } else if (state is LoginLoadedState) {
          context.loaderOverlay.hide();
          saveToken(state.auth.token).then((value) {
            QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                autoCloseDuration: Durations.extralong4,
                showConfirmBtn: false,
                width: AppValues.screenWidth / 4,
                title: AppStrings.success.tr(context));
            context.navigateAndFinish(screenRoute: Routes.mainRoute);
          });
        }
      },
      child: Scaffold(
        appBar: const DefaultAppBar(
          addLang: true,
          addLeadingButton: false,
        ),
        body: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 22),
            children: [
              const TopBar(
                  title: AppStrings.letsSignIn,
                  subTitle: AppStrings.loginSubTitle),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              const LoginInputSection(),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              BottomBar(
                firstTitle: AppStrings.dontHaveAnAccount,
                secondTitle: AppStrings.signUp,
                function: () {
                  context.navigateAndFinish(screenRoute: Routes.registerRoute);
                },
              )
            ]),
      ),
    ));
  }
}
