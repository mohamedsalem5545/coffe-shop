import 'package:flutter/material.dart';

class ItemVertical extends StatelessWidget {
  const ItemVertical({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: double.infinity,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/p2.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              children: [
                Text(
                  "tea",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemVerticala extends StatelessWidget {
  const ItemVerticala({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: double.infinity,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/p2.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              children: [
                Text(
                  "coffe",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemVerticalb extends StatelessWidget {
  const ItemVerticalb({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 120,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: double.infinity,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/p2.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Column(
              children: [
                Text(
                  "mange",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
