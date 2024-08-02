import 'package:ama/core/components/default_components/default_error_message.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/app_colors.dart';
import 'package:ama/features/product_details/presentation/bloc/cubits/color_cubit/color_cubit.dart';
import 'package:ama/features/product_details/presentation/bloc/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/cubits/size_cubit/size_cubit.dart';
import '../bloc/product_details_bloc.dart';
import '../components/bottom_bar_component.dart';
import '../components/header_component.dart';
import '../components/image_view_component.dart';
import '../components/product_information_component.dart';
import '../components/related_products_component.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsLoading) {
              return Scaffold(
                  appBar: AppBar(),
                  body: const DefaultSimmerLoading(
                      type: SimmerLoadingType.detailsScreen));
            } else if (state is ProductDetailsLoaded) {
              final product = state.productDetails;
              return NestedScrollView(
                  headerSliverBuilder: (context, _) => [
                        SliverAppBar(
                          floating: true,
                          snap: true,
                          expandedHeight: AppValues.sizeHeight * 220,
                          pinned: true,
                          scrolledUnderElevation: 0,
                          actions: [
                            SizedBox(
                              width: AppValues.sizeWidth * 10,
                            ),
                            IconButton.outlined(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )),
                            SizedBox(
                              width: AppValues.sizeWidth * 10,
                            ),
                          ],
                          flexibleSpace:
                              ImageViewComponent(images: product.images),
                        )
                      ],
                  body: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => CounterCubit(),
                      ),
                      if (product.colors.isNotEmpty)
                        BlocProvider(
                          create: (context) => ColorCubit(
                              AppColors.hexToColor(product.colors.first)),
                        ),
                      if (product.sizes.isNotEmpty)
                        BlocProvider(
                          create: (context) => SizeCubit(product.sizes.first),
                        ),
                    ],
                    child: Scaffold(
                      bottomNavigationBar: BottomBarComponent(
                        isFavorite: false,
                      ),
                      body: ListView(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppValues.paddingWidth * 20,
                            vertical: AppValues.paddingHeight * 10),
                        children: [
                          const Divider(),
                          SizedBox(
                            height: AppValues.sizeHeight * 10,
                          ),
                          HeaderComponent(
                            title: product.title,
                            price: product.price,
                            rating: product.rating,
                            description: product.description,
                          ),
                          SizedBox(
                            height: AppValues.sizeHeight * 10,
                          ),
                          ProductInformationComponent(product: product),
                          SizedBox(
                            height: AppValues.sizeHeight * 10,
                          ),
                          RelatedProductsComponent(
                              products: product.relatedProducts),
                        ],
                      ),
                    ),
                  ));
            } else if (state is ProductDetailsError) {
              return Scaffold(
                  appBar: AppBar(),
                  body: DefaultErrorMessage(message: state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
