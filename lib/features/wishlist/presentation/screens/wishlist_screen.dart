import 'package:ama/config/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/app_components/ecommerce_components.dart';
import '../../../../core/components/default_components/default_simmer_loading.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';
import '../bloc/wishlist_bloc.dart';

class WithListScreen extends StatelessWidget {
  const WithListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 10,
          vertical: AppValues.paddingHeight * 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppValues.sizeHeight * 10),
            Text(
              AppStrings.favourite.tr(context),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppValues.sizeHeight * 5),
            const Divider(),
            SizedBox(height: AppValues.sizeHeight * 10),
            Expanded(
              child: BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading) {
                    return const DefaultSimmerLoading(
                        scrollDirection: Axis.vertical,
                        type: SimmerLoadingType.grid);
                  } else if (state is WishlistLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        bottom: AppValues.paddingHeight * 50,
                        left: AppValues.paddingWidth * 5,
                        right: AppValues.paddingWidth * 5,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: AppValues.sizeHeight * 5,
                        crossAxisSpacing: AppValues.sizeWidth * 5,
                        crossAxisCount: 2,
                        mainAxisExtent: AppValues.sizeHeight * 240,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return EcommerceComponents.productCard(
                          onTap: () {},
                          context: context,
                          imageUrl: state.products[index].image,
                          rating: state.products[index].rating,
                          productName: state.products[index].name,
                          isAvailable: state.products[index].isAvailable,
                          price: state.products[index].price,
                        );
                      },
                    );
                  } else if (state is WishlistError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ]),
    );
  }
}
