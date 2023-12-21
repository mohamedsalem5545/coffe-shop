import 'package:bookly/Features/login/presentatiion/view/widgets/sigin_in_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SiginRowOptions extends StatefulWidget {
  const SiginRowOptions({
    super.key,
  });

  @override
  State<SiginRowOptions> createState() => _SiginRowOptionsState();
}

class _SiginRowOptionsState extends State<SiginRowOptions> {
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential);
    if (!context.mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil('homepage', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        SiginOption(
          ontap: () {
            signInWithGoogle();
          },
          imageUrl: 'assets/images/google_image.webp',
        ),
        const SizedBox(width: 20),
        const SiginOption(
          imageUrl: 'assets/images/facebook_im.png',
        ),
        const SizedBox(width: 20),
        const SiginOption(
          imageUrl: 'assets/images/logo.png',
        ),
        const Spacer()
      ],
    );
  }
}
