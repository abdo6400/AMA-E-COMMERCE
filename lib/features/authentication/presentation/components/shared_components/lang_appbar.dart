import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/locale/app_localizations.dart';
import '../../../../../core/bloc/global_cubit/locale_cubit.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_values.dart';

class LangAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool addBackButton;
  const LangAppbar({super.key, this.addBackButton = false});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
          Size(AppBar().preferredSize.width, AppBar().preferredSize.height),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 15,
            vertical: AppValues.paddingHeight * 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (addBackButton)
              Material(
                  elevation: 0.5,
                  color: Theme.of(context).cardColor,
                  type: MaterialType.circle,
                  child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: CircleAvatar(
                      // radius: AppValues.radius * 20,
                      backgroundColor: Theme.of(context).cardColor,
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  )),
            Material(
                elevation: 0.5,
                color: Theme.of(context).cardColor,
                type: MaterialType.circle,
                child: GestureDetector(
                  onTap: () => (AppLocalizations.of(context)!.isEnLocale
                      ? context.read<LocaleCubit>().toArabic()
                      : context.read<LocaleCubit>().toEnglish()),
                  child: CircleAvatar(
                    radius: AppValues.radius * 15,
                    backgroundColor: Theme.of(context).cardColor,
                    child: Text(
                        (AppLocalizations.of(context)!.isEnLocale
                                ? AppStrings.arabicCode
                                : AppStrings.englishCode)
                            .toLowerCase(),
                        style: Theme.of(context).textTheme.titleMedium),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
