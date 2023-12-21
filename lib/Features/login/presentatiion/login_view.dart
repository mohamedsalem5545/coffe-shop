// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'package:bookly/Features/login/presentatiion/view/widgets/custom_logo_auth.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/custom_text_field.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/forgot_password.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/logint_button.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/sigin_row_options.dart';
import 'package:bookly/Features/login/presentatiion/view/widgets/to_register.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const  SizedBox(
                    height: 20,
                  ),
                  const LogoImage(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'welcome back',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Center(
                    child: Text(
                      'Find Your drink her',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // const Text(
                  //   'Email',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  // ),
                  CustomtTextForm(
                    labelText: 'Email',
                    hinttext: 'Email',
                    mycontroller: email,
                    validator: (val) {
                      if (val == '') {
                        return 'can not to be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  CustomtTextForm(
                    labelText: 'Password',
                    hinttext: 'Password',
                    mycontroller: password,
                    validator: (val) {
                      if (val == '') {
                        return 'can not to be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ForgotPassword(email: email),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            LoginButton(formState: formState, email: email, password: password),
            const SizedBox(
              height: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            const SiginRowOptions(),
            const SizedBox(
              height: 30,
            ),
            const ToRegister(),
          ],
        ),
      ),
    );
  }
}
