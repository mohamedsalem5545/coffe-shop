import 'package:flutter/material.dart';

class CustomProductSizeText extends StatelessWidget {
  const CustomProductSizeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Size",
      style: TextStyle(
        color: Colors.white.withOpacity(.5),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
