import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:ama/features/authentication/presentation/bloc/login/login_bloc.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../shared_components/password_input.dart';

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({super.key});

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          DefaultTextFormField(
              controller: _email,
              type: TextInputType.emailAddress,
              validate: (value) => CustomValidationHandler.isValidEmail(value!)
                  .translateWithNullSafetyString(context),
              prefix: Icons.email_outlined,
              label: AppStrings.email),
          SizedBox(
            height: AppValues.sizeHeight * 15,
          ),
          PasswordInput(
            controller: _password,
            title: AppStrings.password,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.navigateTo(screenRoute: Routes.forgetPasswordRoute);
                  },
                  child: Text(
                    AppStrings.forgetPassword.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppValues.sizeHeight * 20,
          ),
          DefaultButton(
            margin:
                EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 30),
            onPressed: () {
              if (_loginFormKey.currentState!.validate()) {
                context.read<LoginBloc>().add(
                    SignInEvent(email: _email.text, password: _password.text));
              }
            },
            text: AppStrings.login,
          ),
        ],
      ),
    );
  }
}
