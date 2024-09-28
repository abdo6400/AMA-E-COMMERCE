import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/default_components/default_error_message.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/categories_bloc/categories_bloc.dart';
import 'category_card.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppValues.paddingWidth * 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.categories.tr(context),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              InkWell(
                onTap: () => context.navigateTo(
                    screenRoute: Routes.categoriesRoute,
                    arg: context.read<CategoriesBloc>()),
                child: Text(
                  AppStrings.viewAll.tr(context),
                  style: Theme.of(context).textTheme.titleMedium,
                  selectionColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppValues.sizeHeight * 20),
        SizedBox(
            height: AppValues.sizeHeight * 100,
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
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppValues.paddingWidth * 10),
                      separatorBuilder: (context, index) => SizedBox(
                        width: AppValues.sizeWidth * 15,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) => CategoryCard(
                        category: state is CategoriesLoaded
                            ? state.categories[index]
                            : null,
                      ),
                      itemCount: state is CategoriesLoaded
                          ? state.categories.length
                          : 4,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )),
      ],
    );
  }
}
