import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../bloc/register/register_bloc.dart';
import '../../bloc/timer/timer_cubit.dart';
import '../../components/shared_components/lang_appbar.dart';
import '../../components/shared_components/otp_bottom_bar.dart';
import '../../components/shared_components/otp_input_section.dart';
import '../../components/shared_components/otp_top_section.dart';

class OtpRegisterScreen extends StatelessWidget {
  const OtpRegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    return SafeArea(
      child: BlocProvider(
        create: (context) => WorkoutCubit()..startWorkout(),
        child: Scaffold(
          appBar: const LangAppbar(
            addBackButton: true,
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 22,
                vertical: AppValues.paddingHeight * 15),
            children: [
              OtpTopSection(
                email: data["data"][AppStrings.email],
              ),
              BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is ResendCodeLoadedState) {
                    context.loaderOverlay.hide();
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        autoCloseDuration: Durations.extralong4,
                        showConfirmBtn: false,
                        width: AppValues.screenWidth / 4,
                        title: AppStrings.success.tr(context));
                    data["secureKey"] = state.secureKey;
                    context.read<WorkoutCubit>().startWorkout();
                  }
                },
                buildWhen: (previous, current) =>
                    current is ResendCodeLoadedState,
                builder: (context, state) {
                  return OtpInputSection(
                    email: data["data"][AppStrings.email],
                    function: (value) => context.read<RegisterBloc>().add(
                        SignUpEvent(
                            otp: value,
                            otpSecret: data["secureKey"],
                            email: data["data"][AppStrings.email],
                            name: data["data"][AppStrings.name],
                            password: data["data"][AppStrings.password],
                            phone: data["data"][AppStrings.phoneNumber])),
                  );
                },
              ),
            ],
          ),
          bottomNavigationBar: OtpBottomBar(
            email: data["data"][AppStrings.email],
            function: () => context
                .read<RegisterBloc>()
                .add(ResendCodeEvent(email: data["data"][AppStrings.email])),
          ),
        ),
      ),
    );
  }
}
