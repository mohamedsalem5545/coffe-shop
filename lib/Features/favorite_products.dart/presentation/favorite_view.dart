import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_app_bar_shopping.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  bool var1 = false;

  List<ProductModel> favoriteProductList = [];
  void getData() async {
    favoriteProductList = await GetFavoriteProductCubit()
        .getFavoriteProductData('Ahmed@gamil.com');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
                child: CustomAppBarShoppingCart(title: 'Favorite Products')),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            BlocListener<GetFavoriteProductCubit, GetFavoriteProductsStates>(
              listener: (context, state) {
                if (state is GetFavoriteProductsIsloadingState) {
                  var1 = true;
                } else {
                  var1 == false;
                }
              },
              child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: favoriteProductList.length, (context, index) {
                return ItemSpecial(
                  text: favoriteProductList[index].title,
                  subtext: favoriteProductList[index].descrip,
                  url: favoriteProductList[index].imagUrl,
                  price: favoriteProductList[index].price,
                );
              })),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
