// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'package:bookly/Features/login/presentatiion/view/widgets/custom_logo_auth.dart';
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
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const LogoImage(),

                  // const LoodImage(),//here put image profile
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Resgister Acount',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      'Login To Continue Using The App',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),

                  CustomtTextForm(
                    labelText: 'Username',
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
                    height: 30,
                  ),

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
                    hinttext: 'password',
                    mycontroller: password,
                    validator: (val) {
                      if (val == '') {
                        return 'can not to be empty';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            SignUpButton(
                formState: formState, email: email, password: password),
            const SizedBox(
              height: 50,
            ),
            const ToLogin()
          ],
        ),
      ),
    );
  }
}
