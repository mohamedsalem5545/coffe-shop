import 'package:flutter/material.dart';

class ToLogin extends StatelessWidget {
  const ToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('login');
      },
      child: const Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: ' Have An Account ? '),
              TextSpan(
                  text: 'Login',
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
