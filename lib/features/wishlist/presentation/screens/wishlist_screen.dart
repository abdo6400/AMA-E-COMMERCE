import 'package:ama/features/wishlist/presentation/components/wish_list_component.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/basic_components/authentication_checker_component.dart';
import '../../../../core/components/default_components/default_button.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class WithListScreen extends StatelessWidget {
  const WithListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticationCheckerComponent(
      child: CustomInternetConnectionChecker(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 10,
                      vertical: AppValues.paddingHeight * 5),
                  child: const WishListComponent()),
            ),
            SizedBox(
              width: AppValues.screenWidth,
              child: Container(
                margin: EdgeInsets.only(bottom: AppValues.marginHeight * 50),
                padding: EdgeInsets.symmetric(
                    vertical: AppValues.paddingHeight * 10,
                    horizontal: AppValues.paddingWidth * 30),
                child: DefaultButton(
                  width: AppValues.screenWidth,
                  elevation: 0.5,
                  radius: AppValues.radius * 10,
                  onPressed: () {},
                  text: AppStrings.clearWishList,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
