import 'package:flutter/material.dart';

class SiginOption extends StatelessWidget {
  const SiginOption({super.key, required this.imageUrl, this.ontap});
  final String imageUrl;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        radius: 23,
        backgroundColor: Colors.orangeAccent,
        child: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 247, 246, 246),
          radius: 20,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: const Color.fromARGB(255, 247, 246, 246),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}


