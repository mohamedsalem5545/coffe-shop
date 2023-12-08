import 'package:flutter/material.dart';

class CutomSearchTextField extends StatelessWidget {
  const CutomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(.1),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.discount_outlined,
            color: Colors.orangeAccent,
//color: Colors.black.withOpacity(0.4),
            weight: 0.25,
          ),
          suffixIcon: const Icon(
            Icons.arrow_circle_right_outlined,
            color: Colors.orangeAccent,
//color: Colors.black.withOpacity(0.4),
            weight: 0.25,
          ),
          contentPadding: const EdgeInsets.only(left: 35, top: 22, bottom: 22),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: 'Add Promo Code',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
