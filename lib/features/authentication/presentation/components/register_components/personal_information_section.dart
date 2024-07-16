import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/features/authentication/presentation/bloc/cubit/information_cubit.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/register/register_bloc.dart';
import '../shared_components/password_input.dart';

class PersonalInformationSection extends StatefulWidget {
  final String email;
  const PersonalInformationSection({super.key, required this.email});

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
            controller: null,
            type: TextInputType.emailAddress,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            color: Theme.of(context).cardColor,
            hint: widget.email,
            suffix: Icons.email_outlined,
            textColor: Theme.of(context).cardColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 20,
                vertical: AppValues.paddingHeight * 6),
            readOnly: true,
          ),
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
                context.read<RegisterBloc>().add(SignUpEvent(
                      image: context.read<InformationCubit>().profilePic,
                      name: _name.text,
                      phone: _phoneNumber.text,
                      email: widget.email,
                      password: _password.text,
                      confirmPassword: _confirmPassword.text,
                    ));
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
