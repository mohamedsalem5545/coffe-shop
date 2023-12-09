import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    Key? key,
    required this.slidingAnimation2,
  }) : super(key: key);

  final Animation<Offset> slidingAnimation2;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation2,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation2,
            child: Center(child: Image.asset('assets/images/images.png')),
          );
        });
  }
}
