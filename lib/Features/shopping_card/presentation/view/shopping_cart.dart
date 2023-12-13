import 'package:bookly/Features/shopping_card/presentation/view/category/custom_app_bar_shopping.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_sliver_list.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_text_form_field.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_total_price.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/order_product_widget.dart';
import 'package:flutter/material.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({super.key});

  @override
  State<ShoppingCard> get createState => _ShoppingCardState();
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

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
              child: CustomAppBarShoppingCart(title: 'Shopping Cart')),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          CustomSliverList(
              //   shoppingCardList: shoppingCardList,
              ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
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
