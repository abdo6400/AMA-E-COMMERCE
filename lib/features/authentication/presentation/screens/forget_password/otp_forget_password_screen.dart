import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';
import '../../bloc/timer/timer_cubit.dart';
import '../../components/shared_components/lang_appbar.dart';
import '../../components/shared_components/otp_bottom_bar.dart';
import '../../components/shared_components/otp_input_section.dart';
import '../../components/shared_components/otp_top_section.dart';

class OtpForgetPasswordScreen extends StatelessWidget {
  const OtpForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    String secureKey = data["secureKey"];
    String email = data["email"];
    return Scaffold(
      appBar: const LangAppbar(
        addBackButton: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 22,
            vertical: AppValues.paddingHeight * 15),
        children: [
          OtpTopSection(
            email: email,
          ),
          BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordResendCodeLoadedState) {
                context.loaderOverlay.hide();
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    autoCloseDuration: Durations.extralong4,
                    showConfirmBtn: false,
                    width: AppValues.screenWidth / 4,
                    title: AppStrings.success.tr(context));
                secureKey = state.secureKey;
                context.read<WorkoutCubit>().startWorkout();
              }
            },
            buildWhen: (previous, current) =>
                current is ForgetPasswordResendCodeLoadedState,
            builder: (context, state) {
              return OtpInputSection(
                email: email,
                function: (value) => context.read<ForgetPasswordBloc>().add(
                    ForgetPasswordVerfiyEmailEvent(
                        code: value, secureKey: secureKey, email: email)),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: OtpBottomBar(
        email: email,
        function: () => context
            .read<ForgetPasswordBloc>()
            .add(ForgetPasswordResendCodeEvent(emailOrPhone: email)),
      ),
    );
  }
}
