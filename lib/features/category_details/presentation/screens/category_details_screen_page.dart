import 'package:ama/config/database/api/end_points.dart';
import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/product_card.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/category_details_bloc.dart';
import '../bloc/cubit/sub_categories_cubit.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubCategoriesCubit(),
      child: SafeArea(
        child: BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
          builder: (context, state) {
            if (state is CategoryDetailsLoaded ||
                state is CategoryDetailsLoading) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 1,
                  title: Text(
                      state is CategoryDetailsLoaded
                          ? state.categoryDetails.nameEn
                          : "",
                      style: Theme.of(context).textTheme.titleLarge!),
                ),
                body: DefaultSimmerLoading(
                  loading: state is CategoryDetailsLoading,
                  child: SizedBox(
                    width: AppValues.screenWidth,
                    height: AppValues.screenHeight,
                    child: BlocConsumer<SubCategoriesCubit, int>(
                      listener: (context, state) {},
                      builder: (context, currentSubCategoryIndex) {
                        if (state is CategoryDetailsLoaded &&
                            state.categoryDetails.subCategories.isEmpty) {
                          return Center(
                            child: Text(
                              AppStrings.noSubCategoriesInThisCategoryYet
                                  .tr(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }
                        return Row(children: [
                          Expanded(
                            flex: 2,
                            child: Card(
                              shape: const RoundedRectangleBorder(),
                              elevation: 0.2,
                              margin: EdgeInsets.zero,
                              child: ListView.separated(
                                itemCount: state is CategoryDetailsLoaded
                                    ? state.categoryDetails.subCategories.length
                                    : [].length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => context
                                        .read<SubCategoriesCubit>()
                                        .changeIndex(index),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppValues.paddingWidth * 5,
                                                vertical:
                                                    AppValues.paddingHeight *
                                                        5),
                                            child: Text(
                                                state is CategoryDetailsLoaded
                                                    ? state
                                                        .categoryDetails
                                                        .subCategories[index]
                                                        .nameEn
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_left,
                                          color:
                                              currentSubCategoryIndex == index
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                  : Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: AppValues.screenHeight,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                          ),
                          Expanded(
                              flex: 6,
                              child: ListView.separated(
                                itemCount: state is CategoryDetailsLoaded
                                    ? state
                                        .categoryDetails
                                        .subCategories[currentSubCategoryIndex]
                                        .brands
                                        .length
                                    : [].length,
                                separatorBuilder: (context, index) => Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppValues.paddingHeight * 5),
                                  height: AppValues.sizeHeight * 0.1,
                                  child: const Divider(),
                                ),
                                itemBuilder: (context, brandIndex) {
                                  return Card(
                                    elevation: 0,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    margin: const EdgeInsets.all(0),
                                    shape: const RoundedRectangleBorder(),
                                    child: ExpansionTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(state
                                                is CategoryDetailsLoaded
                                            ? "${EndPoints.images}${state.categoryDetails.subCategories[currentSubCategoryIndex].brands[brandIndex].image}"
                                            : ""),
                                      ),
                                      title: Text(state is CategoryDetailsLoaded
                                          ? state
                                              .categoryDetails
                                              .subCategories[
                                                  currentSubCategoryIndex]
                                              .brands[brandIndex]
                                              .nameEn
                                          : ""),
                                      childrenPadding: EdgeInsets.only(
                                          top: AppValues.paddingHeight * 10,
                                          bottom: AppValues.paddingHeight * 10,
                                          left: AppValues.paddingWidth * 5),
                                      shape: const RoundedRectangleBorder(),
                                      initiallyExpanded: brandIndex == 0,
                                      children: [
                                        SizedBox(
                                          height: AppValues.sizeHeight * 240,
                                          child: state is CategoryDetailsLoaded
                                              ? state
                                                      .categoryDetails
                                                      .subCategories[
                                                          currentSubCategoryIndex]
                                                      .brands[brandIndex]
                                                      .products
                                                      .isEmpty
                                                  ? Center(
                                                      child: Text(
                                                        AppStrings
                                                            .noProductsInThisBrandYet
                                                            .tr(context),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    )
                                                  : ListView.builder(
                                                      itemCount: state
                                                          .categoryDetails
                                                          .subCategories[
                                                              currentSubCategoryIndex]
                                                          .brands[brandIndex]
                                                          .products
                                                          .length,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return SizedBox(
                                                            width: AppValues
                                                                    .sizeWidth *
                                                                160,
                                                            child: ProductCard(
                                                              product: state
                                                                  .categoryDetails
                                                                  .subCategories[
                                                                      currentSubCategoryIndex]
                                                                  .brands[
                                                                      brandIndex]
                                                                  .products[index],
                                                            ));
                                                      },
                                                    )
                                              : const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ))
                        ]);
                      },
                    ),
                  ),
                ),
              );
            } else if (state is CategoryDetailsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                ),
              );
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
