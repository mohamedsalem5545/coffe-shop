import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.white.withOpacity(.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.1),
            borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 40,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(.7),
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(.7),
                  size: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(.7),
                  size: 10,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.white.withOpacity(.7),
                  size: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
