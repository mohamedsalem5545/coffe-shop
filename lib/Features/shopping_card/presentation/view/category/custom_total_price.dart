import 'package:flutter/material.dart';

class CustomTotalPrice extends StatefulWidget {
  final int totalPrice;
  const CustomTotalPrice({super.key, required this.totalPrice});
  @override
  State<CustomTotalPrice> createState() => _CustomTotalPriceState();
}

class _CustomTotalPriceState extends State<CustomTotalPrice> {
  @override
  void initState() {
    super.initState();
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
            Text(widget.totalPrice.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ))
          ],
        ),
      ],
    );
  }
}
