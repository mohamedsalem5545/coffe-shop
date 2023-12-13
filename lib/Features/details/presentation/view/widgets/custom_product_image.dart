import 'package:flutter/material.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: image[0] == 'h'
            ? Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )
            : Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ));
  }
}
