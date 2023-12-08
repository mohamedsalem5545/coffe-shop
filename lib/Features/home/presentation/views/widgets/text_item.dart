import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.isActive, required this.text});

  final bool isActive;

  final String text;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Text(
            text,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(.4),
            ),
          );
  }
}

//int item = 0;

