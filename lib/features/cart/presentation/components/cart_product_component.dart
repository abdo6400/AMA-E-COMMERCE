library cart_item;

import 'package:ama/config/locale/app_localizations.dart';
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
    return Stack(
      children: [
        Card(
          elevation: 0.5,
          margin: AppLocalizations.of(context)!.isEnLocale
              ? EdgeInsets.only(left: AppValues.marginWidth * 20)
              : EdgeInsets.only(right: AppValues.marginWidth * 20),
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppValues.radius * 20),
            side:
                BorderSide(color: Theme.of(context).hintColor.withOpacity(0.2)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppValues.paddingWidth * 10,
                vertical: AppValues.paddingHeight * 5),
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
                          child: Padding(
                            padding: EdgeInsets.all(AppValues.radius * 5),
                            child: Image(
                              image: NetworkImage(widget.imageUrl),
                              height: AppValues.sizeHeight * 80,
                              fit: BoxFit.fill,
                            ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(widget.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: AppValues.font * 16)),
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(widget.category,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            SizedBox(
                              height: AppValues.sizeHeight * 5,
                            ),
                            Text(
                              '${widget.price} €',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        IconButton.outlined(
                            onPressed: widget.onAdd,
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).colorScheme.secondary,
                            )),
                        SizedBox(
                          height: AppValues.sizeHeight * 8,
                        ),
                        Text(
                          widget.quantity.toString(),
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: AppValues.font * 15,
                          ),
                        ),
                        SizedBox(
                          height: AppValues.sizeHeight * 5,
                        ),
                        IconButton(
                            onPressed: widget.onRemove,
                            icon: const Icon(Icons.remove)),
                      ],
                    ))
              ],
            ),
          ),
        ),
        IconButton.outlined(
            onPressed: widget.onRemove,
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppValues.radius * 5),
            )),
            icon: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.error,
            )),
      ],
    );
  }
}
