import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/images.png',
        height: 100,
        width: 200, // Replace with the URL of your image
        //   fit: BoxFit.cover,
      ),
    );
  }
}
