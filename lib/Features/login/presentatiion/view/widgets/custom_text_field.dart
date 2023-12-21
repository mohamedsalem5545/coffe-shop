import 'package:flutter/material.dart';

class CustomtTextForm extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;
  final String labelText;
  const CustomtTextForm(
      {super.key,
      required this.hinttext,
      required this.mycontroller,
      required this.validator,
      required this.labelText});

  @override
  State<CustomtTextForm> createState() => _CustomtTextFormState();
}

class _CustomtTextFormState extends State<CustomtTextForm> {
  bool var1 = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          var1 == true && widget.labelText == 'Password' ? true : false,
      cursorColor: Colors.orangeAccent,
      style: const TextStyle(color: Colors.white),
      validator: widget.validator,
      controller: widget.mycontroller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.labelText == 'Password'
            ? IconButton(
                onPressed: () {
                  if (var1 == true) {
                    var1 = false;
                  } else {
                    var1 = true;
                  }
                  setState(() {});
                },
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.orangeAccent,
                ))
            : null,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18),
        hintText: 'Enter Your ${widget.hinttext}',
        hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
        //   contentPadding:
        //   const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orangeAccent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orangeAccent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.orangeAccent)),
      ),
    );
  }
}
