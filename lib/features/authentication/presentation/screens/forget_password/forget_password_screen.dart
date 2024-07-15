import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_appbar.dart';
import '../../../../../core/utils/app_enums.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../../components/forget_components/forget_input_section.dart';
import '../../components/shared_components/topbar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            context.loaderOverlay.show();
          } else if (state is ForgetPasswordErrorState) {
            context.loaderOverlay.hide();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              autoCloseDuration: Durations.extralong4,
              showConfirmBtn: false,
              width: AppValues.screenWidth / 4,
              title: AppStrings.someThingWentWrong.tr(context));
          } else if (state is ForgetPasswordCheckEmailLoadedState) {
            context.loaderOverlay.hide();
          QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              autoCloseDuration: Durations.extralong4,
              showConfirmBtn: false,
              width: AppValues.screenWidth / 4,
              title: AppStrings.success.tr(context))
                .then((value) async {
              context.navigateTo(
                  screenRoute: Routes.otpForgetPasswordRoute,
                  arg: {"secureKey": state.secureKey, "email": state.email});
            });
          } else if (state is ForgetPasswordVerifyEmailLoadedState) {
            context.loaderOverlay.hide();
            QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    autoCloseDuration: Durations.extralong4,
                    showConfirmBtn: false,
                    width: AppValues.screenWidth / 4,
                    title: AppStrings.success.tr(context))
                .then((value) {
              context.navigateAndFinish(
                  screenRoute: Routes.resetPasswordRoute, arg: state.email);
            });
          } else if (state is ResetPasswordLoadedState) {
            context.loaderOverlay.hide();
            QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    autoCloseDuration: Durations.extralong4,
                    showConfirmBtn: false,
                    width: AppValues.screenWidth / 4,
                    title: AppStrings.success.tr(context))
                .then((value) => context.navigateAndFinishAll(
                    screenRoute: Routes.loginRoute));
          }
        },
        child: Scaffold(
          appBar: const DefaultAppBar(
            addLang: true,
            addLeadingButton: true,
          ),
          body: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 20),
            children: [
              SizedBox(
                height: AppValues.sizeHeight * 20,
              ),
              const TopBar(
                  title: AppStrings.forgetPassword,
                  subTitle: AppStrings.enterEmailThat),
              SizedBox(
                height: AppValues.sizeHeight * 20,
              ),
              const ForgetInputSection()
            ],
          ),
        ));
  }
}
