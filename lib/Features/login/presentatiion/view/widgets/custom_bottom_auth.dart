import 'package:flutter/material.dart';

class CustomBottomAuth extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomBottomAuth({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.orange,
      textColor: Colors.white,
      child: Text(title),
    );
  }
}
