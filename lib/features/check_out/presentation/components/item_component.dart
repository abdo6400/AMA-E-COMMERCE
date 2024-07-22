import 'package:flutter/material.dart';

import '../../../../core/utils/app_values.dart';

class ItemComponent extends StatelessWidget {
  final String imageUrl;
  final double price;
  final String title;
  final int quantity;
  const ItemComponent(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.title,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppValues.radius * 10),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2)),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: AppValues.paddingWidth * 10,
          vertical: AppValues.paddingHeight * 5),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppValues.radius * 5),
            child: Image(
              image: NetworkImage(imageUrl),
              height: AppValues.sizeHeight * 80,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          width: AppValues.sizeWidth * 10,
        ),
        Expanded(
          flex: 4,
          child: ListTile(
            enabled: false,
            isThreeLine: true,
            title: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              '$price \$',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            contentPadding: EdgeInsets.zero,
            trailing: CircleAvatar(
              child: Text(
                '$quantity',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
