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
  const ShoppingCard({super.key, required this.email});
  final String email;
  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  int totalprice = 0;
  int disscontvalue = 0;
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
          CustomSliverList(
            email: widget.email,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CutomSearchTextField(
                  onchanged: ((value) {
                    if (value.isNotEmpty) {
                      disscontvalue = int.parse(value);
                    } else {
                      disscontvalue = 0;
                    }

                    setState(() {});
                  }),
                ),
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
                    totalPrice: disscontvalue == 111
                        ? totalprice * 0.8
                        : disscontvalue == 333
                            ? totalprice * 0.85
                            : double.parse(totalprice.toString()),
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
