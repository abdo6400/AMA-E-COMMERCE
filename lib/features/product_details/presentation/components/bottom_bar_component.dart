import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBarComponent extends StatelessWidget {
  BottomBarComponent({super.key, required this.isFavorite});
  bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 20,
          vertical: AppValues.paddingHeight * 10),
      child: Row(
        children: [
          StatefulBuilder(
            builder: (context, setState) => InkWell(
              onTap: () => setState(() => isFavorite = !isFavorite),
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(AppValues.radius * 5),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppValues.paddingWidth * 10,
                      vertical: AppValues.paddingHeight * 5),
                  child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).hintColor),
                ),
              ),
            ),
          ),
          SizedBox(width: AppValues.sizeWidth * 10),
          Expanded(
            child: DefaultButton(
              radius: 5,
              onPressed: () {},
              text: AppStrings.addToCart,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
