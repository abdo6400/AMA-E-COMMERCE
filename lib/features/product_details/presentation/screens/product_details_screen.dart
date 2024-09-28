import 'package:ama/core/components/default_components/default_error_message.dart';
import 'package:ama/core/components/default_components/default_simmer_loading.dart';
import 'package:ama/core/utils/alerts_extensions.dart';
import 'package:ama/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ama/features/product_details/presentation/bloc/cubits/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
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
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state.isAdded) {
            context.showToast(AppStrings.productAddedToCart);
          }
        },
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoaded ||
                  state is ProductDetailsLoading) {
                return DefaultSimmerLoading(
                  loading: state is ProductDetailsLoading,
                  child: NestedScrollView(
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
                                // const CartIconComponent(
                                //     icon: Icons.shopping_cart_checkout),
                                SizedBox(
                                  width: AppValues.sizeWidth * 10,
                                ),
                              ],
                              flexibleSpace: ImageViewComponent(
                                  images: state is ProductDetailsLoaded
                                      ? state.productDetails.images
                                      : []),
                            )
                          ],
                      body: BlocProvider(
                        create: (context) => CounterCubit(),
                        child: Scaffold(
                          bottomNavigationBar: BottomBarComponent(
                            id: state is ProductDetailsLoaded
                                ? state.productDetails.id
                                : 0,
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
                                title: state is ProductDetailsLoaded
                                    ? state.productDetails.titleEn
                                    : "",
                                price: state is ProductDetailsLoaded
                                    ? state.productDetails.price
                                    : 0,
                                rating: state is ProductDetailsLoaded
                                    ? state.productDetails.rating
                                    : 0,
                                description: state is ProductDetailsLoaded
                                    ? state.productDetails.descriptionEn
                                    : "",
                              ),
                              SizedBox(
                                height: AppValues.sizeHeight * 10,
                              ),
                              ProductInformationComponent(
                                  product: state is ProductDetailsLoaded
                                      ? state.productDetails
                                      : null),
                              SizedBox(
                                height: AppValues.sizeHeight * 10,
                              ),
                              RelatedProductsComponent(
                                  products: state is ProductDetailsLoaded
                                      ? state.productDetails.relatedProducts
                                      : []),
                            ],
                          ),
                        ),
                      )),
                );
              } else if (state is ProductDetailsError) {
                return Scaffold(
                    appBar: AppBar(),
                    body: DefaultErrorMessage(message: state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
