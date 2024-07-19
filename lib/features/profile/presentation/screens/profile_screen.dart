import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/bloc/global_cubit/theme_cubit.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_components/default_setting_item.dart';
import '../../../../core/utils/app_values.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
      children: [
        SettingsGroup(
          settingsGroupTitle: AppStrings.settings.tr(context),
          icon: Icons.settings_outlined,
          items: [
            SettingsItem(
              onTap: () =>
                  context.navigateTo(screenRoute: Routes.languagesRoute),
              backgroundColor: AppColors.darkGrey,
              icon: const Icon(
                Icons.language_outlined,
                color: AppColors.white,
              ),
              title: AppStrings.changeLang.tr(context),
              subtitle: AppLocalizations.of(context)!.isEnLocale
                  ? AppStrings.english
                  : AppStrings.arabic,
            ),
            SettingsItem(
              onTap: () => context.navigateTo(screenRoute: Routes.themeRoute),
              icon: const Icon(
                Icons.dark_mode_rounded,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.primary,
              title: AppStrings.changeTheme.tr(context),
              subtitle:
                  context.read<ThemeCubit>().currentThemeMode.name.toString(),
            ),
          ],
        ),
        // You can add a settings title
        SettingsGroup(
          settingsGroupTitle: AppStrings.account.tr(context),
          icon: Icons.person_outline_rounded,
          items: [
            SettingsItem(
              onTap: () {},
              backgroundColor: AppColors.greenDark,
              icon: const Icon(
                Icons.person_outline_outlined,
                color: AppColors.white,
              ),
              title: AppStrings.profileInformation.tr(context),
              subtitle: AppStrings.changeAccountInformation.tr(context),
            ),
            SettingsItem(
              onTap: () {},
              backgroundColor: AppColors.blueLight,
              icon: const Icon(
                Icons.receipt_rounded,
                color: AppColors.white,
              ),
              title: AppStrings.myOrders.tr(context),
            ),
            SettingsItem(
              onTap: () {},
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.black,
              title: AppStrings.logout.tr(context),
            ),
            SettingsItem(
              onTap: () {},
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.error,
              title: AppStrings.deleteAccount.tr(context),
            ),
          ],
        ),
        SettingsGroup(
            settingsGroupTitle: AppStrings.aboutUs.tr(context),
            icon: Icons.info_outline_rounded,
            items: [
              SettingsItem(
                onTap: () {},
                icon: const Icon(
                  Icons.contact_support,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.secondary,
                title: AppStrings.contactUs.tr(context),
                //subtitle: AppStrings.con.tr(context),
              ),
              SettingsItem(
                onTap: () {},
                icon: const Icon(
                  Icons.info_rounded,
                  color: AppColors.white,
                ),
                backgroundColor: AppColors.green,
                title: AppStrings.learnMoreAboutApp.tr(context),
                //  subtitle: AppStrings.learnMoreAboutApp.tr(context),
              ),
            ])
      ],
    );
  }
}
