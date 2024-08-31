import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';
import '../app_logo_component.dart';

class DrawerMenuComponent extends StatelessWidget {

  const DrawerMenuComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isEn = AppLocalizations.of(context)!.isEnLocale;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: !isEn
              ? Radius.circular(AppValues.radius * 50)
              : Radius.circular(AppValues.radius * 10),
          bottomRight: isEn
              ? Radius.circular(AppValues.radius * 50)
              : Radius.circular(AppValues.radius * 10),
          topLeft: !isEn
              ? Radius.circular(AppValues.radius * 50)
              : Radius.circular(AppValues.radius * 10),
          topRight: isEn
              ? Radius.circular(AppValues.radius * 50)
              : Radius.circular(AppValues.radius * 10)),
    );
    return Card(
        shape: shape,
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
        margin: EdgeInsets.symmetric(
            horizontal: 0, vertical: AppValues.marginHeight * 20),
        child: Drawer(
          width: AppValues.screenWidth * 0.7,
          shape: shape,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const AppLogoComponent(),
            const Divider(),
            SizedBox(
              height: AppValues.sizeHeight * 10,
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              title: Text(AppStrings.profile.tr(context)),
              leading: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              title: Text(AppStrings.myOrders.tr(context)),
              leading: const Icon(
                Icons.receipt_rounded,
                color: Colors.green,
              ),
            ),
            ListTile(
              onTap: () => Navigator.of(context).pop(),
              title: Text(AppStrings.notifcations.tr(context)),
              leading: const Icon(
                Icons.notifications,
                color: Colors.amber,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                context.navigateTo(screenRoute: Routes.languagesRoute);
              },
              title: Text(AppStrings.languages.tr(context)),
              leading: const Icon(
                Icons.language_outlined,
                color: Colors.blueGrey,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                context.navigateTo(screenRoute: Routes.themeRoute);
              },
              title: Text(AppStrings.themes.tr(context)),
              leading: const Icon(
                Icons.dark_mode_rounded,
                color: Colors.yellow,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                context.navigateTo(screenRoute: Routes.amaChatRoute);
              },
              title: Text(AppStrings.chatWithAi.tr(context)),
              leading: Icon(
                Icons.chat,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              title: Text(AppStrings.chatWithUs.tr(context)),
              leading: const Icon(
                Icons.contact_support,
                color: Colors.blue,
              ),
            ),
            const Spacer(),
            ListTile(
                tileColor: Theme.of(context).colorScheme.secondary,
                onTap: () => Navigator.of(context).pop(),
                title: Text(
                  AppStrings.logout.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).cardColor),
                ),
                leading: Icon(
                  Icons.logout_outlined,
                  color: Theme.of(context).cardColor,
                ))
          ]),
        ));
  }
}
