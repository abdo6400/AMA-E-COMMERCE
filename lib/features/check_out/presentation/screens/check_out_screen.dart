import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/alerts_extensions.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:ama/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ama/features/check_out/presentation/bloc/blocs/checkout_bloc/check_out_bloc.dart';
import 'package:ama/features/check_out/presentation/bloc/cubits/address_cubit.dart';
import 'package:ama/features/check_out/presentation/bloc/cubits/payment_cubit.dart';
import 'package:ama/features/check_out/presentation/screens/address_screen.dart';
import 'package:ama/features/check_out/presentation/screens/payment_type_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../cart/domain/entities/cart_product.dart';
import '../components/payment_components/payment_form_component.dart';
import '../bloc/cubits/controller_screens_cubit.dart';
import 'items_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final cartItems =
        ModalRoute.of(context)!.settings.arguments as List<CartProduct>;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ControllerScreensCubit(),
        ),
        BlocProvider(
          create: (context) => AddressCubit("1"),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: BlocListener<CheckOutBloc, CheckOutState>(
            listener: (context, state) {
              if (state is CheckoutLoading) {
                context.loaderOverlay.show();
              } else if (state is CheckoutFailure) {
                context.loaderOverlay.hide();
              } else if (state is CheckoutCashSuccess) {
                context.loaderOverlay.hide();
                context.read<CartBloc>().add(ClearCartProductsEvent());
                context.showSuccessQuickAlert(
                    AppStrings.success, () => context.navigateToFirstRoute());
              } else if (state is CheckoutCardSuccess) {
                context.loaderOverlay.hide();
                showBottomSheet(
                    context: context,
                    builder: (context) => PaymentFormComponent(
                          paymentUrl: state.payment.paymentUrl,
                        ));
              }
            },
            child: BlocConsumer<ControllerScreensCubit, int>(
              listener: (context, state) {},
              builder: (context, state) => Scaffold(
                appBar: AppBar(
                  title: Text(AppStrings.checkOut.tr(context)),
                  elevation: 4,
                  centerTitle: true,
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endTop,
                floatingActionButton: Material(
                  color: AppColors.greenDark.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(AppValues.radius * 10),
                  child: Padding(
                    padding: EdgeInsets.all(AppValues.radius * 5),
                    child: Text("${state + 1} / ${3}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.white)),
                  ),
                ),
                body: PageView.builder(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) => context
                        .read<ControllerScreensCubit>()
                        .changeCurrentPage(value),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return [
                        ItemsScreen(items: cartItems),
                        const AddressScreen(),
                        const PaymentTypeScreen(),
                      ][index];
                    }),
                bottomNavigationBar: Card(
                  margin: EdgeInsets.zero,
                  elevation: 10,
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingWidth * 20,
                        vertical: AppValues.paddingHeight * 20),
                    child: Row(
                      children: [
                        if (state != 0)
                          Flexible(
                            child: DefaultButton(
                              background: Colors.transparent,
                              borderColor:
                                  Theme.of(context).colorScheme.secondary,
                              textColor: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color!,
                              elevation: 0,
                              onPressed: () => pageController.previousPage(
                                  duration: Durations.extralong1,
                                  curve: Curves.easeIn),
                              text: AppStrings.back,
                            ),
                          ),
                        SizedBox(
                          width: AppValues.paddingWidth * 10,
                        ),
                        BlocBuilder<AddressCubit, String>(
                          builder: (context, addressId) {
                            return BlocBuilder<PaymentCubit, String>(
                              builder: (context, type) {
                                return Flexible(
                                  flex: 2,
                                  child: DefaultButton(
                                    onPressed: () => state == 2
                                        ? context.read<CheckOutBloc>().add(
                                              type == AppStrings.cash
                                                  ? CheckoutCashRequested(
                                                      addressId: addressId)
                                                  : CheckoutCardRequested(
                                                      addressId: addressId),
                                            )
                                        : pageController.nextPage(
                                            duration: Durations.extralong1,
                                            curve: Curves.easeIn),
                                    text: state == 2
                                        ? AppStrings.confirm
                                        : AppStrings.next,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
