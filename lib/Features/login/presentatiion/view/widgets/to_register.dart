import 'package:flutter/material.dart';

class ToRegister extends StatelessWidget {
  const ToRegister({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed('signup');
      },
      child: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Donot Have An Account ? '),
              TextSpan(
                  text: 'Register',
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
