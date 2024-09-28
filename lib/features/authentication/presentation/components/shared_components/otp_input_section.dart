import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ama/core/utils/commons.dart';
import '../../../../../core/components/default_components/default_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class OtpInputSection extends StatelessWidget {
  final String email;
  final Function function;
  const OtpInputSection(
      {super.key,
      required this.email,
      required this.function});
  static String? value;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: AppValues.sizeWidth * 100,
      margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 5),
      height: AppValues.sizeHeight * 50,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).hintColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(AppValues.radius * 20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.secondary),
      borderRadius: BorderRadius.circular(AppValues.radius * 10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
    return Column(
      children: [
        SizedBox(
          height: AppValues.sizeHeight * 50,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            keyboardType: TextInputType.number,
            pinAnimationType: PinAnimationType.slide,
            onTapOutside: (event) => context.closeKeyboard(),
            showCursor: true,
            onCompleted: (code) => value = code,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
          ),
        ),
        SizedBox(
          height: AppValues.sizeHeight * 50,
        ),
        DefaultButton(
          margin: EdgeInsets.symmetric(horizontal: AppValues.marginWidth * 30),
          onPressed: () {
            if (value != null) {
              function(value);
            }
          },
          text: AppStrings.confirm,
        ),
      ],
    );
  }
}
