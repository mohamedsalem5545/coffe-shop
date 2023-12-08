import 'package:flutter/material.dart';

class CustomAppBarShoppingCart extends StatelessWidget {
  const CustomAppBarShoppingCart({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IconButton(
        //     onPressed: () {
        //        Navigator.pop(context);
        //     },
        //     icon: const Icon(Icons.arrow_back)),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
