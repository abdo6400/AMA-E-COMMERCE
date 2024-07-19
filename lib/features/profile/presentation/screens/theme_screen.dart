import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/bloc/global_cubit/theme_cubit.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});
  Widget _buildGridTile(
      {required ThemeMode themeMode,
      required BuildContext context,
      required String label,
      required Color? color,
      required IconData icon}) {
    final isSelected = context.read<ThemeCubit>().currentThemeMode == themeMode;
    return CheckboxListTile(
        title: Row(
          children: [
            Icon(icon, color: color),
            SizedBox(
              width: AppValues.sizeWidth * 5,
            ),
            Text(label.tr(context),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        value: isSelected,
        checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 50)),
        onChanged: (_) {
          switch (themeMode) {
            case ThemeMode.light:
              context.read<ThemeCubit>().toLightMode();
              break;
            case ThemeMode.dark:
              context.read<ThemeCubit>().toDarkMode();
              break;
            default:
              context.read<ThemeCubit>().toSystemMode();
              break;
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.themes.tr(context)),
          elevation: 1,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            _buildGridTile(
              themeMode: ThemeMode.light,
              label: AppStrings.lightTheme,
              color: Colors.amber,
              context: context,
              icon: Icons.wb_sunny,
            ),
            _buildGridTile(
              themeMode: ThemeMode.dark,
              label: AppStrings.darkTheme,
              context: context,
              color: Colors.red,
              icon: Icons.nights_stay,
            ),
            _buildGridTile(
              themeMode: ThemeMode.system,
              label: AppStrings.automaticTheme,
              context: context,
              color: null,
              icon: Icons.brightness_auto,
            ),
          ],
        ),
      ),
    );
  }
}
