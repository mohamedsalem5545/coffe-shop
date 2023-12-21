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
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color:const Color.fromARGB(255, 233, 135, 6),
      textColor: Colors.white,
      child: Text(
        title,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}
