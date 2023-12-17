import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/shopping_card/presentation/view/category/custom_app_bar_shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavoriteProducts extends StatefulWidget {
  const FavoriteProducts({super.key});

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  bool var1 = false;

  @override
  void initState() {
    BlocProvider.of<GetFavoriteProductCubit>(context)
        .getFavoriteProductData('Ahmed@gamil.com');
    super.initState();
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
              child: BlocBuilder<GetFavoriteProductCubit,
                  GetFavoriteProductsStates>(
                builder: (context, state) {
                  if (state is GetFavoriteProductsSucessState) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.favoriteProductList.length,
                        (context, index) {
                          return ItemSpecial(
                            text: state.favoriteProductList[index].title,
                            subtext: state.favoriteProductList[index].descrip,
                            url: state.favoriteProductList[index].imagUrl,
                            price: state.favoriteProductList[index].price,
                          );
                        },
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 600,
                        child: Center(
                          child: SpinKitThreeInOut(
                            color:
                                Colors.grey, // Set the color of the animation
                            size: 50.0, // Set the size of the animation
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
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
