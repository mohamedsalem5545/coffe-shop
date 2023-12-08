import 'package:flutter/material.dart';

class CustomproductPriceColumn extends StatelessWidget {
  final String price;
  const CustomproductPriceColumn({
    super.key,
    required this.s,
    required this.m,
    required this.price,
  });

  final bool s;
  final bool m;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Price",
          style: TextStyle(
            color: Colors.white.withOpacity(.6),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Text(
              "\$",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              s
                  ? '${int.parse(price)}'
                  : m
                      ? '${int.parse(price) + 1}'
                      : '${int.parse(price) + 2}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
