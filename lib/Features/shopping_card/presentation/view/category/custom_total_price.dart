import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTotalPrice extends StatefulWidget {
  const CustomTotalPrice({super.key});
  @override
  State<CustomTotalPrice> get createState => _CustomTotalPriceState();
}

class _CustomTotalPriceState extends State<CustomTotalPrice> {
  int totalPrice = 0;
  @override
  void initState() {
    super.initState();
    totalPrice = BlocProvider.of<GetShoppingCardProducts>(context).calTotalPrice();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // totalPrice = BlocProvider.of<DeleteCubit>(context).totalPrice;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total Price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("\$ ",
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            BlocBuilder<GetShoppingCardProducts, GetShoppingCardProductsStates>(
              builder: (context, state) {
                if (state is CalTotalPriceState) {
                  return Text(state.totalprice.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ));
                } else {
                  return  Text(totalPrice.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ));
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
