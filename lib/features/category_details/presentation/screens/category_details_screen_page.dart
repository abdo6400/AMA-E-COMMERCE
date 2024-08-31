import 'package:ama/config/database/api/end_points.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
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
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
          ),
          body: BlocBuilder<CategoryDetailsBloc, CategoryDetailsState>(
            builder: (context, state) {
              if (state is CategoryDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CategoryDetailsLoaded) {
                final categoryDetails = state.categoryDetails;
                return SizedBox(
                    width: AppValues.screenWidth,
                    height: AppValues.screenHeight,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: AppValues.paddingHeight * 5,
                          left: AppValues.paddingWidth * 5,
                          right: AppValues.paddingWidth * 5),
                      child: BlocConsumer<SubCategoriesCubit, int>(
                        listener: (context, state) {},
                        builder: (context, currentSubCategoryIndex) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                    width: AppValues.screenWidth,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            "${EndPoints.images}${categoryDetails.image}",
                                          ),
                                          radius: AppValues.radius * 30,
                                        ),
                                        SizedBox(
                                          width: AppValues.sizeWidth * 10,
                                        ),
                                        Text(categoryDetails.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!),
                                        const Spacer(),
                                        Text(
                                          "${categoryDetails.subCategories.length} subCategories",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!,
                                        )
                                      ],
                                    )),
                              ),
                              const Divider(),
                              Expanded(
                                flex: 12,
                                child: Row(children: [
                                  Expanded(
                                    flex: 2,
                                    child: ListView.separated(
                                      itemCount:
                                          categoryDetails.subCategories.length,
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemBuilder: (context, index) {
                                        final subCategory = categoryDetails
                                            .subCategories[index];
                                        return InkWell(
                                          onTap: () => context
                                              .read<SubCategoriesCubit>()
                                              .changeIndex(index),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: AppValues
                                                              .paddingWidth *
                                                          5,
                                                      vertical: AppValues
                                                              .paddingHeight *
                                                          5),
                                                  child: Text(subCategory.name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_left,
                                                color: currentSubCategoryIndex ==
                                                        index
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
                                      child: ListView.builder(
                                        itemCount: categoryDetails
                                            .subCategories[
                                                currentSubCategoryIndex]
                                            .brands
                                            .length,
                                        itemBuilder: (context, index) {
                                          final brand = categoryDetails
                                              .subCategories[
                                                  currentSubCategoryIndex]
                                              .brands[index];
                                          return ExpansionTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  "${EndPoints.images}${brand.image}"),
                                            ),
                                            title: Text(brand.name),
                                            childrenPadding: EdgeInsets.zero,
                                            children: [
                                              SizedBox(
                                                height:
                                                    AppValues.sizeHeight * 220,
                                                child: ListView.builder(
                                                  itemCount:
                                                      brand.products.length,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return SizedBox(
                                                      width:
                                                          AppValues.sizeWidth *
                                                              180,
                                                      child: EcommerceComponents
                                                          .productCard(
                                                        onTap: () =>
                                                            context.navigateTo(
                                                          screenRoute: Routes
                                                              .productDetailsRoute,
                                                          arg: brand
                                                              .products[index]
                                                              .id,
                                                        ),
                                                        context: context,
                                                        imageUrl:
                                                            "${EndPoints.images}${brand.products[index].images.first}",
                                                        rating: brand
                                                            .products[index]
                                                            .rating,
                                                        productName: brand
                                                            .products[index]
                                                            .title,
                                                        isAvailable: brand
                                                                .products[index]
                                                                .stock >
                                                            0,
                                                        price: brand
                                                            .products[index]
                                                            .price,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      )),
                                ]),
                              ),
                            ],
                          );
                        },
                      ),
                    ));
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
      ),
    );
  }
}
