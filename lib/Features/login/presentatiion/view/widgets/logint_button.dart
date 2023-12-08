// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/custom_bottom_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formState,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formState;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return CustomBottomAuth(
      title: 'Login',
      onPressed: () async {
        if (formState.currentState!.validate()) {
          try {
            final credential =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.text,
              password: password.text,
            );
            if (credential.user!.emailVerified) {
              Navigator.of(context).pushReplacementNamed('homepage');
            } else {
              FirebaseAuth.instance.currentUser!.sendEmailVerification();

              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'verified your email  and enter on your link',
              ).show();
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
         //     print('No user found for that email.');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'No user found for that email.',
              ).show();
            } else if (e.code == 'too-many-requests') {
          //    print('Wrong password provided for that user.');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'Wrong password provided for that user.',
              ).show();
            }
          }
        } else {
        //  print('not valid');
        }
      },
    );
  }
}
