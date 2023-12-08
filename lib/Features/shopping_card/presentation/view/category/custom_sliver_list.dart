import 'package:bookly/Features/home/data/Cubits/delete_note_cubit/delete_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/delete_note_cubit/delete_cubit_states.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_product_card_shopping_cart.dart';
import 'package:bookly/core/utils/function/custom_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<DeleteCubit, DeleteState>(
      builder: (context, state) {
        if (state is DeleteProductState) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: shoppingProductList.length, (context, index) {
            return ProductShoppingCardItem(
              text: shoppingProductList[index].title,
              subtext: shoppingProductList[index].descrip,
              url: shoppingProductList[index].imagUrl,
              price: shoppingProductList[index].price,
              numberOfPices: shoppingProductList[index].numberOfPaces!,
              index: index,
            );
          }));
        } else {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: shoppingProductList.length, (context, index) {
            return ProductShoppingCardItem(
              text: shoppingProductList[index].title,
              subtext: shoppingProductList[index].descrip,
              url: shoppingProductList[index].imagUrl,
              price: shoppingProductList[index].price,
              numberOfPices: shoppingProductList[index].numberOfPaces!,
              index: index,
            );
          }));
        }
      },
    );
  }
}
