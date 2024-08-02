import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/features/authentication/presentation/components/shared_components/auth_curve.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:supercharged/supercharged.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../../components/forget_components/forget_input_section.dart';
import '../../components/shared_components/lang_appbar.dart';
import '../../components/shared_components/topbar.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
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
                  text: state.message,
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
            appBar: const LangAppbar(
              addBackButton: true,
            ),
            body: AuthCurve(
              widget: Column(
                children: [
                  const TopBar(
                      title: AppStrings.forgetPassword,
                      subTitle: AppStrings.enterEmailThat),
                  SizedBox(
                    height: AppValues.sizeHeight * 10,
                  ),
                  const ForgetInputSection(),
                  SizedBox(
                    height: AppValues.sizeHeight * 10,
                  ),
                  Text(AppStrings.forgetPasswordInstructions.tr(context),
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(
                    height: AppValues.sizeHeight * 10,
                  ),
                  const StepWidget(
                    stepText: [
                      AppStrings.forgetPasswordStep1,
                      AppStrings.forgetPasswordStep2,
                      AppStrings.forgetPasswordStep3
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class StepWidget extends StatelessWidget {
  final List<String> stepText;

  const StepWidget({
    super.key,
    required this.stepText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: stepText.map((step) {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth*10),
        title: Text(step.tr(context),
            style: Theme.of(context).textTheme.bodyLarge),
        leading: CircleAvatar(
          child: Text(
            step.toList().last,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).cardColor,
                ),
          ),
        ),
      );
    }).toList());
  }
}
