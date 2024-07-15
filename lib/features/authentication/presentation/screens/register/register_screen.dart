import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/register/register_bloc.dart';
import '../../components/register_components/register_input_section.dart';
import '../../components/shared_components/bottombar.dart';
import '../../components/shared_components/topbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          context.loaderOverlay.show();
        } else if (state is RegisterErrorState) {
          context.loaderOverlay.hide();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              autoCloseDuration: Durations.extralong4,
              showConfirmBtn: false,
              width: AppValues.screenWidth / 4,
              title: AppStrings.someThingWentWrong.tr(context));
        } else if (state is SignUpLoadedState) {
          context.loaderOverlay.hide();
          saveToken(state.auth.token).then((value) => QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  autoCloseDuration: Durations.extralong4,
                  showConfirmBtn: false,
                  width: AppValues.screenWidth / 4,
                  title: AppStrings.someThingWentWrong.tr(context))
              .then((value) =>
                  context.navigateAndFinishAll(screenRoute: Routes.mainRoute)));
        } else if (state is CheckEmailLoadedState) {
          context.loaderOverlay.hide();
          QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  autoCloseDuration: Durations.extralong4,
                  showConfirmBtn: false,
                  width: AppValues.screenWidth / 4,
                  title: AppStrings.success.tr(context))
              .then((value) {
            context.navigateTo(
                screenRoute: Routes.otpRegisterRoute,
                arg: {"secureKey": state.secureKey, "email": state.email});
          });
        } else if (state is VerifyEmailLoadedState) {
          context.loaderOverlay.hide();
          QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  autoCloseDuration: Durations.extralong4,
                  showConfirmBtn: false,
                  width: AppValues.screenWidth / 4,
                  title: AppStrings.success.tr(context))
              .then((value) => context.navigateAndFinish(
                  screenRoute: Routes.informationRoute, arg: state.email));
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
                  title: AppStrings.createAccount,
                  subTitle: AppStrings.reigsterSubTitle),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              const RegisterInputSection(),
              SizedBox(
                height: AppValues.sizeHeight * 30,
              ),
              BottomBar(
                firstTitle: AppStrings.haveAnAccount,
                secondTitle: AppStrings.login,
                function: () {
                  context.navigateAndFinish(screenRoute: Routes.loginRoute);
                },
              )
            ]),
      ),
    ));
  }
}
