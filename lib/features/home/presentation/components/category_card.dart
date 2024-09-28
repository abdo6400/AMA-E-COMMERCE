import 'package:ama/config/locale/app_localizations.dart';
import 'package:ama/config/routes/app_routes.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/commons.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';
import '../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final isCategoryLoaded = category != null;
    return InkWell(
      onTap: () =>isCategoryLoaded? context.navigateTo(screenRoute: Routes.categoryDetailsScreenRoute,arg: category!.id):null,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.radius * 10),
          side: BorderSide(color: Theme.of(context).hintColor.withOpacity(0.1)),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                  padding: EdgeInsets.all(AppValues.radius * 10),
                  child: isCategoryLoaded
                      ? Material(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppValues.radius * 10),
                          ),
                          type: MaterialType.card,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(AppValues.radius * 10),
                            child: Image.network(
                              category!.image,
                              width: AppValues.sizeWidth * 80,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          width: AppValues.sizeWidth * 80,
                          color: Theme.of(context).hintColor,
                        )),
            ),
            Expanded(
                flex: 1,
                child: Text(
                  isCategoryLoaded
                      ? category!.nameEn
                      : AppStrings.loading.tr(context),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: AppValues.font * 12,
                      ),
                )),
            SizedBox(
              height: AppValues.sizeHeight * 5,
            ),
          ],
        ),
      ),
    );
  }
}
