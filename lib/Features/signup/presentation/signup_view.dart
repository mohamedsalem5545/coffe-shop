// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:bookly/Features/login/presentatiion/view/widgets/custom_text_field.dart';
import 'package:bookly/Features/signup/presentation/view/widgets/sign_up_button.dart';
import 'package:bookly/Features/signup/presentation/view/widgets/to_login.dart';
import 'package:flutter/material.dart';

class SingnUpView extends StatefulWidget {
  const SingnUpView({super.key});

  @override
  State<SingnUpView> createState() => _SingnUpViewState();
}

class _SingnUpViewState extends State<SingnUpView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                  ),
                  // const LoodImage(),//here put image profile
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login To Continue Using The App',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'username',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomtTextForm(
                    hinttext: 'Enter Your username',
                    mycontroller: username,
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
                  const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CustomtTextForm(
                    hinttext: 'Enter Your email',
                    mycontroller: email,
                    validator: (val) {
                      if (val == '') {
                        return 'can not to be empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomtTextForm(
                    hinttext: 'Enter Your password',
                    mycontroller: password,
                    validator: (val) {
                      if (val == '') {
                        return 'can not to be empty';
                      }
                      return null;
                    },
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(top: 10, bottom: 20),
                  //   alignment: Alignment.topRight,
                  //   child: const Text(
                  //     'forgot password?',
                  //     style: TextStyle(fontSize: 18),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SignUpButton(
                formState: formState, email: email, password: password),
            const SizedBox(
              height: 20,
            ),
            const ToLogin()
          ],
        ),
      ),
    );
  }
}
