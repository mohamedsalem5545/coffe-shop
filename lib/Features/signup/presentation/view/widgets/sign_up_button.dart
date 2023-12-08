// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/custom_bottom_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
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
      title: 'SignUp',
      onPressed: () async {
        if (formState.currentState!.validate()) {
          try {
            final credential =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email.text,
              password: password.text,
            );
            FirebaseAuth.instance.currentUser!.sendEmailVerification();
            Navigator.of(context).pushReplacementNamed('login');
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              print('The password provided is too weak.');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'The password provided is too weak.',
              ).show();
            } else if (e.code == 'email-already-in-use') {
              print('The account already exists for that email.');
              AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.rightSlide,
                title: 'Error',
                desc: 'The account already exists for that email.',
              ).show();
            }
          } catch (e) {
            print(e);
          }
        } else {
          print('not valid');
        }
      },
    );
  }
}
