import 'package:bookly/Features/shopping_card/presentation/view/category/custom_product_card_shopping_cart.dart';
import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({
    super.key,
  });

  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
      return ProductShoppingCardItem(
        text: 'ahmed',
        subtext: 'ahmed',
        url: 'assets/images/logo.jpeg',
        price: '10',
        numberOfPices: 4,
        index: index,
      );
    }));
  }
}
