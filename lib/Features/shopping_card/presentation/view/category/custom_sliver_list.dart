import 'package:bookly/Features/shopping_card/presentation/view/category/custom_product_card_shopping_cart.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({
    super.key,required this.shoppingCardList
  });
 final List<ProductModel>shoppingCardList;
  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: widget.shoppingCardList.length, (context, index) {
      return ProductShoppingCardItem(
        text: widget.shoppingCardList[index].title,
        subtext: 'ahmed',
        url: 'assets/images/logo.jpeg',
        price: '10',
        numberOfPices: 4,
        index: index,
      );
    }));
  }
}
