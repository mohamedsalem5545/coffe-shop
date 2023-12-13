
import 'package:bookly/Features/splesh/widget/splesh_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xff020202),
      body: SplashViewbody(),
    );
  }
}
