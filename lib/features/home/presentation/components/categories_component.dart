import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

import '../bloc/categories_bloc/categories_bloc.dart';

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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              InkWell(
                onTap: () {},
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
                
                if (state is CategoriesLoading) {
                  return const DefaultSimmerLoading(
                      type: SimmerLoadingType.listOfCircleText);
                } else if (state is CategoriesError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else if (state is CategoriesLoaded) {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppValues.paddingWidth * 10),
                    separatorBuilder: (context, index) => SizedBox(
                      width: AppValues.sizeWidth * 15,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        EcommerceComponents.categoryCard(
                      image: state.categories[index].image,
                      title: state.categories[index].name,
                    ),
                    itemCount: state.categories.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                  );
                }
                return const SizedBox.shrink();
              },
            )),
      ],
    );
  }
}
