import 'package:flutter/material.dart';

import '../../../../../core/utils/app_values.dart';
import 'payment_card_component.dart';

class SavedCardsComponent extends StatelessWidget {
  const SavedCardsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.only(bottom: AppValues.paddingHeight * 50),
          separatorBuilder: (context, index) => SizedBox(
                height: AppValues.sizeHeight * 10,
              ),
          itemCount: fakeDataList.length+1,
          itemBuilder: (context, index) {
            return const PaymentCardComponent();
          }),
    );
  }
}

List<Map<String, String>> fakeDataList = [];
