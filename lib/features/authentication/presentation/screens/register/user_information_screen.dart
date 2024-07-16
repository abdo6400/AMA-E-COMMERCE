import 'package:ama/features/authentication/presentation/components/shared_components/topbar.dart';
import 'package:flutter/material.dart';
import 'package:ama/core/utils/app_values.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../components/register_components/personal_information_section.dart';
import '../../components/shared_components/auth_curve.dart';
import '../../components/shared_components/lang_appbar.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AuthCurve(
      height: 0.4,
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const LangAppbar(
          addBackButton: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: AppValues.paddingWidth * 22,
              vertical: AppValues.paddingHeight * 15),
          children: [
            const TopBar(
                title: AppStrings.fillInformation,
                subTitle: AppStrings.editMessage),
            SizedBox(
              height: AppValues.sizeHeight * 35,
            ),
            PersonalInformationSection(
              email: ModalRoute.of(context)?.settings.arguments as String,
            )
          ],
        ),
      ),
    ));
  }
}
