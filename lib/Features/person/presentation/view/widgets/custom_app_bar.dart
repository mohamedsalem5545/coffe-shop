import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('homepage', (route) => false);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            )),
        const SizedBox(width: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
