// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});
//   final id = 'SplashScreen';
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView>
//     with SingleTickerProviderStateMixin {
//
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(
//       SystemUiMode.immersive,
//     );
//     Future.delayed(const Duration(seconds: 3), () {
//       //Navigator.pushNamed(context, 'homepage');
//       if (FirebaseAuth.instance.currentUser != null &&
//           FirebaseAuth.instance.currentUser!.emailVerified) {
//         return Navigator.pushNamed(context, 'homepage');
//       } else {
//         return Navigator.pushNamed(context, 'homepage');
//       }
//     });
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(
//       SystemUiMode.manual,
//       overlays: SystemUiOverlay.values,
//     );
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff020202),
//       body: Center(
//           child: Container(
//         padding: const EdgeInsets.all(20),
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           //  borderRadius: BorderRadius.circular(50),
//           image: DecorationImage(
//             image: AssetImage('assets/images/images.png'),
//           ),
//         ),
//       )),
//     );
//   }
// }

import 'package:bookly/Features/splesh/widget/splesh_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color(0xff020202),
      body: SplashViewbody(),
    );
  }
}
