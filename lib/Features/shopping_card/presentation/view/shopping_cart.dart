import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_app_bar_shopping.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_sliver_list.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_text_form_field.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_total_price.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/order_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key});

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  //List<ProductModel> shoppingCardList = [];
  //int totaPrice = 0;
  // void getData() async {
  //   shoppingCardList = await BlocProvider.of<GetShoppingCardProducts>(context)
  //       .getShoppingCardProductData('Ahmed@gamil.com');
  //   setState(() {});
  //   for (var i = 0; i < shoppingCardList.length; i++) {
  //     totaPrice += int.parse(shoppingCardList[i].price) *
  //         shoppingCardList[i].numberOfPaces!;
  //   }
  //   setState(() {});
  // }
  int totalprice = 0;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverToBoxAdapter(
              child: CustomAppBarShoppingCart(title: 'Shopping Cart')),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          const CustomSliverList(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CutomSearchTextField(),
                const SizedBox(height: 20),
                BlocListener<GetShoppingCardProducts,
                    GetShoppingCardProductsStates>(
                  listener: (context, state) {
                    if (state is CalTotalPriceState) {
                      totalprice = state.totalprice;
                      setState(() {});
                    }
                  },
                  child: CustomTotalPrice(
                    totalPrice: totalprice,
                  ),
                ),
                const SizedBox(height: 40),
                const OrderProductWidget(),
                const SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
