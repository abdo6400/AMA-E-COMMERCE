import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:ama/features/check_out/presentation/screens/address_screen.dart';
import 'package:ama/features/check_out/presentation/screens/confirm_order_screen.dart';
import 'package:ama/features/check_out/presentation/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/controller_screens_cubit.dart';
import 'items_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  static final sections = [
    const ItemsScreen(),
    const AddressScreen(),
    const PaymentScreen(),
    const ConfirmOrderScreen()
  ];
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ControllerScreensCubit, int>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(AppStrings.checkOut.tr(context)),
            elevation: 4,
            centerTitle: true,
          ),
          body: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) => context
                  .read<ControllerScreensCubit>()
                  .changeCurrentPage(value),
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return sections[index];
              }),
          bottomNavigationBar: Card(
            margin: EdgeInsets.zero,
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.paddingWidth * 20,
                  vertical: AppValues.paddingHeight * 20),
              child: Row(
                children: [
                  if (state != 0)
                    Flexible(
                      child: DefaultButton(
                        background: Colors.transparent,
                        borderColor: Theme.of(context).colorScheme.secondary,
                        textColor:
                            Theme.of(context).textTheme.titleMedium!.color!,
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
                  Flexible(
                    flex: 2,
                    child: DefaultButton(
                      onPressed: () => state == 3
                          ? Navigator.pop(context)
                          : pageController.nextPage(
                              duration: Durations.extralong1,
                              curve: Curves.easeIn),
                      text: state == 3 ? AppStrings.confirm : AppStrings.next,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
