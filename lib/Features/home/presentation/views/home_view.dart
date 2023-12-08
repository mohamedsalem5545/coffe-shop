import 'package:bookly/Features/favorite_products.dart/presentation/favorite_view.dart';
import 'package:bookly/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly/Features/person/presentation/person_view.dart';
import 'package:bookly/Features/shopping_card/presentation/view/shopping_cart.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: getScreen(index),
        bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  Icons.home,
                  color:
                      index == 0 ? Colors.orange : Colors.grey.withOpacity(.6),
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    index == 1
                        ? Icons.shopping_cart_checkout
                        : Icons.shopping_cart_checkout_outlined,
                    color: index == 1
                        ? Colors.orange
                        : Colors.grey.withOpacity(.6),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    index == 2
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: index == 2
                        ? Colors.orange
                        : Colors.grey.withOpacity(.6),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Icon(
                    index == 3 ? Icons.person_2 : Icons.person_2_outlined,
                    color: index == 3
                        ? Colors.orange
                        : Colors.grey.withOpacity(.6),
                  )),
            ]),
      ),
    );
  }


}
  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return const HomeViewBody();
      case 1:
        return const ShoppingCard();
      case 2:
        return const FavoriteProducts(
        );
      default:
        return const PersonBody();
    }
  }