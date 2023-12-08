// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.email,
  });

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (email.text == '') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'you should write your email and enter on forgote password',
          ).show();
          return;
        }
        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(
            email: email.text,
          );
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'we send email enter the link in email for change password',
          ).show();
        } catch (e) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'you should write correct email and try again',
          ).show();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        alignment: Alignment.topRight,
        child: const Text(
          'forgot password?',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
