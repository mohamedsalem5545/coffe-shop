import 'package:flutter/material.dart';

class CustomProductIconAndCategoryname extends StatelessWidget {
  const CustomProductIconAndCategoryname({
    super.key,
    required this.categoryName,
    required this.icon,
  });
  final String categoryName;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Colors.orange,
            ),
            Text(
              categoryName,
              style: TextStyle(
                color: Colors.white.withOpacity(.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
