import 'package:flutter/material.dart';

class CustomTotalPrice extends StatefulWidget {
  const CustomTotalPrice({
    super.key,
  });

  @override
  State<CustomTotalPrice> createState() => _CustomTotalPriceState();
}

class _CustomTotalPriceState extends State<CustomTotalPrice> {
  int totalPrice = 0;

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
            Text(totalPrice.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                )),
          ],
        ),
      ],
    );
  }
}
