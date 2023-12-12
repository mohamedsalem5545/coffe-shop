import 'package:bookly/Features/shopping_card/presentation/view/category/custom_product_card_shopping_cart.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key, required this.shoppingCardList});
  final List<ProductModel> shoppingCardList;
  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: widget.shoppingCardList.length, (context, index) {
      return ProductShoppingCardItem(
        text: widget.shoppingCardList[index].title,
        subtext: widget.shoppingCardList[index].descrip,
        url: widget.shoppingCardList[index].imagUrl,
        price: (int.parse(widget.shoppingCardList[index].price) *
                widget.shoppingCardList[index].numberOfPaces!)
            .toString(),
        numberOfPices: widget.shoppingCardList[index].numberOfPaces!,
        index: index,
      );
    }));
  }
}
