import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_product_card_shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList({super.key});

  @override
  State<CustomSliverList> get createState => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetShoppingCardProducts>(context)
        .getShoppingCardProductData('Ahmed@gamil.com');
  }

  Widget build(BuildContext context) {
    return BlocBuilder<GetShoppingCardProducts, GetShoppingCardProductsStates>(
      builder: (context, state) {
        if (state is GetShoppingCardProductsSucessState) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.shoppingCardList.length, (context, index) {
            return ProductShoppingCardItem(
              text: state.shoppingCardList[index].title,
              subtext: state.shoppingCardList[index].descrip,
              url: state.shoppingCardList[index].imagUrl,
              price: (int.parse(state.shoppingCardList[index].price) *
                      state.shoppingCardList[index].numberOfPaces!)
                  .toString(),
              numberOfPices: state.shoppingCardList[index].numberOfPaces!,
              index: index,
            );
          }));
        } else {
          return SliverToBoxAdapter(
            child: Container(
              height: 600,
              child: const Center(
                child: SpinKitThreeInOut(
                  color: Colors.grey, // Set the color of the animation
                  size: 50.0, // Set the size of the animation
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
