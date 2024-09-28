import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/utils/alerts_extensions.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../utils/app_enums.dart';
import '../../../utils/app_values.dart';
import '../../cubits/manage_mobile_cubit/manage_mobile_cubit.dart';
import 'appbar_components.dart';
import 'drawer_menu_component.dart';
import 'tabview_component.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({super.key, required this.screens});
  final List<Map<String, dynamic>> screens;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ManageMobileCubit(),
        child: BlocListener<WishlistBloc, WishlistState>(
          listener: (context, state) {
            if (state.isAdded) {
              context.showToast(AppStrings.productAddedToWishlist);
            } else if (state.isDeleted) {
              context.showToast(AppStrings.productRemovedFromWishlist,
                  state: ToastStates.error);
            }
          },
          child: FloatingDraggableWidget(
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
              screenHeight: AppValues.screenHeight,
              screenWidth: AppValues.screenWidth,
              dx: AppValues.screenWidth * 0.9,
              dy: AppValues.screenHeight * 0.5,
              mainScreenWidget: Scaffold(
                drawer: const DrawerMenuComponent(),
                body: NestedScrollView(
                    headerSliverBuilder: (context, _) => [
                          AppbarComponents(
                            title: screens[context
                                    .watch<ManageMobileCubit>()
                                    .currentPage]["title"]
                                .toString(),
                          )
                        ],
                    body: TabviewComponent(
                      screens: screens,
                    )),
              )),
        ),
      ),
    );
  }
}
