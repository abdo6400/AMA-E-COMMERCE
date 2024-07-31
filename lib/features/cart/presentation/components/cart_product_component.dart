library cart_item;

import 'package:ama/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.category,
      this.onAdd,
      this.onRemove});
  final String category;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppValues.paddingWidth * 10,
            vertical: AppValues.paddingHeight * 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppValues.radius * 20),
                      child: Image(
                        image: NetworkImage(widget.imageUrl),
                        height: AppValues.sizeHeight * 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppValues.sizeWidth * 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.name,
                            style: Theme.of(context).textTheme.displayMedium),
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        Text(widget.category,
                            style: Theme.of(context).textTheme.displaySmall),
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        Text(
                          '${widget.price} €',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: widget.onAdd,
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        )),
                    Text(
                      widget.quantity.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    IconButton(
                        onPressed: widget.onRemove,
                        icon: const Icon(Icons.remove)),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
