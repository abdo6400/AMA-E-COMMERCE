import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ama/config/locale/app_localizations.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';
import '../../../../../core/utils/custom_validation.dart';
import '../../bloc/forget_password/forget_password_bloc.dart';

class ForgetInputSection extends StatefulWidget {
  const ForgetInputSection({super.key});

  @override
  State<ForgetInputSection> createState() => _ForgetInputSectionState();
}

class _ForgetInputSectionState extends State<ForgetInputSection> {
  final TextEditingController _email = TextEditingController();
  final _forgetFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forgetFormKey,
      child: Column(
        children: [
          DefaultTextFormField(
              type: TextInputType.emailAddress,
              controller: _email,
              validate: (value) => CustomValidationHandler.isValidEmail(value!)
                  .translateWithNullSafetyString(context),
              prefix: Icons.email_outlined,
              label: AppStrings.email),
          SizedBox(
            height: AppValues.sizeHeight * 40,
          ),
          DefaultButton(
            margin:
                EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 30),
            onPressed: () {
              if (_forgetFormKey.currentState!.validate()) {
                context
                    .read<ForgetPasswordBloc>()
                    .add(ForgetPasswordCheckEmailEvent(email: _email.text));
              }
            },
            text: AppStrings.send,
          ),
        ],
      ),
    );
  }
}
