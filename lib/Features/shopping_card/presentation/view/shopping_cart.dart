import 'package:bookly/Features/home/data/Cubits/delete_note_cubit/delete_cubit.dart';
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
  @override
  void initState() {
    // totalPrice = BlocProvider.of<DeleteCubit>(context).calulatTotalPrice();
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DeleteCubit(),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: CustomAppBarShoppingCart(title: 'Shopping Cart')),
              SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              CustomSliverList(),
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
        )
        // } else {
        //   return const Padding(
        //     padding: EdgeInsets.all(20),
        //     child: CustomScrollView(
        //       physics: BouncingScrollPhysics(),
        //       slivers: [
        //         SliverToBoxAdapter(
        //             child: CustomAppBarShoppingCart(title: 'Shopping Cart')),
        //         SliverToBoxAdapter(
        //           child: SizedBox(height: 30),
        //         ),
        //         CustomSliverList(),
        //         SliverToBoxAdapter(
        //           child: SizedBox(height: 20),
        //         ),
        //         SliverToBoxAdapter(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.end,
        //             children: [
        //               CutomSearchTextField(),
        //               SizedBox(height: 20),
        //               CustomTotalPrice(),
        //               SizedBox(height: 40),
        //               OrderProductWidget(),
        //               SizedBox(height: 30),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   );
        // }

        );
  }
}
