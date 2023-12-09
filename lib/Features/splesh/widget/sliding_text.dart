import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required this.slidingAnimation1,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation1;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation1,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation1,
            child: const Text(
              'Welcome you',
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
