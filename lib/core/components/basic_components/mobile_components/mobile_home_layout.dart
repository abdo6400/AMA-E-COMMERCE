import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_values.dart';
import '../../cubits/manage_mobile_cubit/manage_mobile_cubit.dart';
import 'appbar_components.dart';
import 'drawer_menu_component.dart';
import 'tabview_component.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({super.key, required this.screens});
  final List<Map<String, dynamic>> screens;
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageMobileCubit(),
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return FloatingDraggableWidget(
              deleteWidget: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColors.error,
                ),
                onPressed: () {},
              ),
              deleteWidgetAlignment: Alignment.topCenter,
              floatingWidget: InkWell(
                onTap: () =>
                    context.navigateTo(screenRoute: Routes.amaChatRoute),
                child: const CircleAvatar(
                  child: Icon(Icons.chat_outlined),
                ),
              ),
              floatingWidgetHeight: AppValues.sizeHeight * 60,
              floatingWidgetWidth: AppValues.sizeWidth * 60,
              autoAlign: true,
              screenHeight: size.maxHeight,
              screenWidth: size.maxWidth,
              dx: AppValues.screenWidth * 0.9,
              dy: AppValues.screenHeight * 0.5,
              mainScreenWidget: Scaffold(
                key: scaffoldKey,
                drawer: const DrawerMenuComponent(),
                body: NestedScrollView(
                    headerSliverBuilder: (context, _) => [
                          AppbarComponents(
                            scaffoldKey: scaffoldKey,
                            title: screens[context
                                    .watch<ManageMobileCubit>()
                                    .currentPage]["title"]
                                .toString(),
                          )
                        ],
                    body: TabviewComponent(
                      screens: screens,
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
