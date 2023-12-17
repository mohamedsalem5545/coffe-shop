import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    //  required TextEditingController field2Controller,
    required this.fieldController,
    required this.title,
  });

  TextEditingController? fieldController;
  String? title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.orangeAccent,
      controller: fieldController,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors
                    .orangeAccent), // Set the color of the underline when focused
          ),
          labelText: title,
          labelStyle: const TextStyle(color: Colors.orangeAccent)),
    );
  }
}
