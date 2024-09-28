import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/components/default_components/default_internet_connection_checker.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_strings.dart';
import '../bloc/categories_bloc/categories_bloc.dart';
import '../components/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.categories.tr(context)),
        elevation: 1,
      ),
      body: CustomInternetConnectionChecker(
          child: BlocProvider.value(
        value: ModalRoute.of(context)!.settings.arguments as CategoriesBloc,
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesError) {
              return DefaultErrorMessage(
                message: state.message,
              );
            } else if (state is CategoriesLoaded ||
                state is CategoriesLoading) {
              return DefaultSimmerLoading(
                loading: state is CategoriesLoading,
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingWidth * 20,
                        vertical: AppValues.paddingHeight * 20),
                    itemCount:
                        state is CategoriesLoaded ? state.categories.length : 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: AppValues.sizeHeight * 10,
                      crossAxisSpacing: AppValues.sizeWidth * 10,
                    ),
                    itemBuilder: (ctx, index) => CategoryCard(
                          category: state is CategoriesLoaded
                              ? state.categories[index]
                              : null,
                        )),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      )),
    );
  }
}
