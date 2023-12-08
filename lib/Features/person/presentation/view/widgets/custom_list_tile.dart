import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.loadingIcon,
    required this.title,
    this.ontap,
  });
  final IconData? loadingIcon;
  final String title;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // tileColor: const Color(0xfff5f6f9),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.orangeAccent,
      ),
      leading: Icon(
        loadingIcon,
        color: Colors.orangeAccent,
        size: 26,
      ),
      // selectedColor: Colors.red,
      // selectedTileColor: Colors.red,
      titleTextStyle: const TextStyle(color: Colors.white),
      title: Text(title),
    );
  }
}
