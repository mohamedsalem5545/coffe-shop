import 'package:bookly/Features/splesh/widget/sliding_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with TickerProviderStateMixin {
  late AnimationController animationController1, animationController2;
  late Animation<Offset> slidingAnimation1, slidingAnimation2;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation1();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController1.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingImage(slidingAnimation2: slidingAnimation2),
        const SizedBox(
          height: 2,
        ),
        SlidingText(slidingAnimation1: slidingAnimation1),
      ],
    );
  }

  void initSlidingAnimation1() {
    animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation1 =
        Tween<Offset>(begin: const Offset(0, 6), end: Offset.zero)
            .animate(animationController1);
    slidingAnimation2 = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(animationController2);
    animationController2.forward();
    animationController1.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == 'mohamedsalem5545@gmail.com') {
        return Navigator.pushNamed(context, 'admin');
      } else if (FirebaseAuth.instance.currentUser != null &&
          FirebaseAuth.instance.currentUser!.emailVerified) {
        return Navigator.pushNamed(context, 'homepage');
      } else {
        return Navigator.pushNamed(context, 'login');
      }
    });
  }
}
