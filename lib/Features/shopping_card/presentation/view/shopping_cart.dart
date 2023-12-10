import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_app_bar_shopping.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_sliver_list.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_text_form_field.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_total_price.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/order_product_widget.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key});

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  List<ProductModel> shoppingCardList = [];

  @override
  void initState() async {
    shoppingCardList = await BlocProvider.of<GetShoppingCardProducts>(context)
        .getShoppingCardProductData('Ahmed@gamil.com');
    super.initState();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
              child: CustomAppBarShoppingCart(title: 'Shopping Cart')),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          CustomSliverList(
            shoppingCardList: shoppingCardList,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CutomSearchTextField(),
                SizedBox(height: 20),
                CustomTotalPrice(),
                SizedBox(height: 40),
                OrderProductWidget(),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
