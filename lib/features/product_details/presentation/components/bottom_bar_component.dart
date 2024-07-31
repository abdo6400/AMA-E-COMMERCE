import 'package:ama/core/components/default_components/default_button.dart';
import 'package:ama/core/utils/app_strings.dart';
import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class BottomBarComponent extends StatelessWidget {
  const BottomBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 20,
          vertical: AppValues.paddingHeight * 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(AppValues.radius * 5),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppValues.paddingWidth * 10,
                    vertical: AppValues.paddingHeight * 5),
                child: Icon(Icons.favorite_border,
                    color: Theme.of(context).hintColor),
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
