
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/app_values.dart';

class WindowsHomeLayout extends StatefulWidget {
  final List<Map<String, dynamic>> screens;
  const WindowsHomeLayout({super.key, required this.screens});

  @override
  State<WindowsHomeLayout> createState() => _WindowsHomeLayoutState();
}

class _WindowsHomeLayoutState extends State<WindowsHomeLayout> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                flex: 1,
                child: HomeDrawer(
                  selectedIndex: selectedIndex,
                  fun: (p0) => setState(() {
                    selectedIndex = p0;
                  }),
                )),
            Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(flex: 1, child: CustomAppbar()),
                    Expanded(
                        flex: 15,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppValues.paddingWidth * 40),
                          child: widget.screens[selectedIndex]['screen'],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CutomDrawerButton extends StatelessWidget {
  final String name;
  final int index;
  final IconData iconData;
  final Function(int) fun;
  final int selectedIndex;
  const CutomDrawerButton(
      {super.key,
      required this.name,
      required this.index,
      required this.iconData,
      required this.fun,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == selectedIndex;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => fun(index),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 0,
          color: isSelected ? AppColors.primary : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 36),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.paddingWidth * 20,
                  vertical: AppValues.paddingHeight * 12),
              child: Row(
                children: [
                  Icon(
                    iconData,
                    color: isSelected ? AppColors.white : AppColors.blueLight,
                    size: AppValues.font * 20,
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 12,
                  ),
                  Text(name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: AppValues.font * 12,
                          color: isSelected
                              ? AppColors.white
                              : AppColors.blueLight))
                ],
              )),
        ),
      ),
    );
  }
}


class CustomAppbar extends StatelessWidget {
  CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        //height: AppVa,
        child: Card(
      color: AppColors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          
            
          ],
        ),
      ),
    ));
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.fun, required this.selectedIndex});
  final int selectedIndex;
  final Function(int) fun;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 1,
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppValues.paddingHeight * 30,
              horizontal: AppValues.paddingWidth * 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                AppImages.appLogo,
                height: AppValues.sizeHeight * 150,
                width: AppValues.sizeWidth * 150,
                fit: BoxFit.fill,
              ),
              Divider(),
              SizedBox(
                height: AppValues.sizeHeight * 36,
              ),
              CutomDrawerButton(
                index: 0,
                fun: fun,
                selectedIndex: selectedIndex,
                name: AppStrings.home.tr(context),
                iconData: Icons.dashboard_outlined,
              ),
              SizedBox(
                height: AppValues.sizeHeight * 28,
              ),
              CutomDrawerButton(
                index: 1,
                selectedIndex: selectedIndex,
                fun: fun,
                name: AppStrings.invoices.tr(context),
                iconData: Icons.receipt,
              ),
              SizedBox(
                height: AppValues.sizeHeight * 28,
              ),
             
              SizedBox(
                height: AppValues.sizeHeight * 28,
              ),
              /* CutomDrawerButton(
                index: 3,
                fun: fun,
                selectedIndex: selectedIndex,
                name: AppStrings.invoices.tr(context),
                iconData: Icons.receipt,
              ),
              SizedBox(
                height: AppValues.sizeHeight * 28,
              ),*/
              
              SizedBox(
                height: AppValues.sizeHeight * 28,
              ),
             /* CutomDrawerButton(
                index: 4,
                fun: fun,
                selectedIndex: selectedIndex,
                name: AppStrings.profile.tr(context),
                iconData: Icons.person_outlined,
              ),*/
              const Spacer(),
              Divider(),
              ListTile(
                hoverColor: AppColors.primary.withOpacity(0.5),
                style: ListTileStyle.list,
                onTap: () => context.navigateAndFinish(screenRoute: Routes.initialRoute),
                title: Text(AppStrings.logout.tr(context),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: AppValues.font * 15,
                        color: AppColors.blueLight)),
                trailing: Icon(
                  Icons.logout_outlined,
                  color: AppColors.error,
                ),
              ),
              SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
              Divider(),
              SizedBox(
                height: AppValues.sizeHeight * 25,
              ),
              Text("ALl Rights © ama within 2024",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: AppValues.font * 8,
                      color: AppColors.blueLight))
            ],
          )),
    );
  }
}
