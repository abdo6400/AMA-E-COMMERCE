import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/config/locale/app_localizations.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/register/register_bloc.dart';
import '../shared_components/password_input.dart';

class PersonalInformationSection extends StatefulWidget {
  const PersonalInformationSection({super.key});

  @override
  State<PersonalInformationSection> createState() =>
      _PersonalInformationSectionState();
}

class _PersonalInformationSectionState
    extends State<PersonalInformationSection> {
  final GlobalKey<FormState> _informationFormKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _phoneNumber.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _informationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          DefaultTextFormField(
              controller: _name,
              type: TextInputType.name,
              prefix: Icons.person,
              validate: (value) => CustomValidationHandler.isValidName(value!)
                  .translateWithNullSafetyString(context),
              label: AppStrings.name),
          SizedBox(
            height: AppValues.sizeHeight * 15,
          ),
          DefaultTextFormField(
              controller: _phoneNumber,
              type: TextInputType.phone,
              prefix: Icons.phone,
              validate: (value) =>
                  CustomValidationHandler.isValidPhoneNumber(value!)
                      .translateWithNullSafetyString(context),
              label: AppStrings.phoneNumber),
          SizedBox(
            height: AppValues.sizeHeight * 15,
          ),
          PasswordInput(
            controller: _password,
            title: AppStrings.password,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 15,
          ),
          PasswordInput(
            controller: _password,
            confirmPassword: _confirmPassword,
            title: AppStrings.confirmPassword,
          ),
          SizedBox(
            height: AppValues.sizeHeight * 15,
          ),
          DefaultButton(
            text: AppStrings.signUp,
            onPressed: () {
              if (_informationFormKey.currentState!.validate()) {
                // context.read<RegisterBloc>().add(SignUpEvent(
                //       name: _name.text,
                //       phone: _phoneNumber.text,
                //       email: _email.text,
                //       password: _password.text,
                //       confirmPassword: _confirmPassword.text,
                //       otp: "",
                //       otpSecret: "",
                //     ));
              }
            },
            margin:
                EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 30),
          ),
        ],
      ),
    );
  }
}
