import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/app_routes.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_values.dart';
import '../cubits/auth_check_cubit/auth_check_cubit.dart';

class AuthenticationCheckerComponent extends StatefulWidget {
  final Widget child;
  const AuthenticationCheckerComponent({super.key, required this.child});

  @override
  State<AuthenticationCheckerComponent> createState() => _AuthenticationCheckerComponentState();
}

class _AuthenticationCheckerComponentState extends State<AuthenticationCheckerComponent> {

  @override
  void initState() {
    super.initState();
    context.read<AuthCheckCubit>().checkAuthentication();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCheckCubit, bool>(
      listener: (context, isAuthenticated) {},
      builder: (context, isAuthenticated) {
        if (isAuthenticated) {
          return widget.child;
        } else {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: AppValues.font * 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(height: AppValues.sizeHeight * 10),
                Text(
                  AppStrings.pleaseSignToUseAllFeatures.tr(context),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: AppValues.sizeHeight * 20),
                DefaultButton(
                    text: AppStrings.login,
                    onPressed: () =>
                        context.navigateTo(screenRoute: Routes.loginRoute)),
                SizedBox(height: AppValues.sizeHeight * 10),
                DefaultButton(
                    text: AppStrings.signUp,
                    background: Colors.transparent,
                    elevation: 0,
                    textColor: Theme.of(context).textTheme.titleSmall!.color!,
                    borderColor: Theme.of(context).textTheme.titleSmall!.color!,
                    onPressed: () =>
                        context.navigateTo(screenRoute: Routes.registerRoute)),
              ],
            ),
          );
        }
      },
    );
  }
}
