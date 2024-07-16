import 'package:flutter/material.dart';
import '../../../../../core/utils/app_values.dart';
import '../../components/forget_components/forget_top_Section.dart';
import '../../components/forget_components/reset_password_input_section.dart';
import '../../components/shared_components/lang_appbar.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String email =
        (ModalRoute.of(context)?.settings.arguments as String?) ??
            "abamr6400gmail.com";
    return SafeArea(
      child: Scaffold(
        appBar: const LangAppbar(
          addBackButton: true,
        ),
        body: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 22,
                vertical: AppValues.paddingHeight * 15),
            children: [
              ForgetTopSection(
                eamil: email,
              ),
              ResetPasswordInputSection(
                email: email,
              )
            ]),
      ),
    );
  }
}
