import 'package:flutter/material.dart';
import 'package:ama/config/locale/app_localizations.dart';
import '../../../../../core/components/default_components/default_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_validation.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController? confirmPassword;
  final String title;
  static bool isVisiable = true;
  const PasswordInput({
    super.key,
    required this.controller,
    required this.title,
    this.confirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return DefaultTextFormField(
          controller: confirmPassword ?? controller,
          type: TextInputType.visiblePassword,
          validate: confirmPassword != null
              ? (value) =>
                  (value != null && value.compareTo(controller.text) == 0)
                      ? null
                      : AppStrings.pleaseEnterVaildConfirmPassword.tr(context)
              : (value) => CustomValidationHandler.isValidPassword(value!)
                  .translateWithNullSafetyString(context),
          prefix: Icons.lock_outline,
          isPassword: isVisiable,
          suffixPressed: () => setState(() => isVisiable = !isVisiable),
          suffix: isVisiable
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          label: title);
    });
  }
}
