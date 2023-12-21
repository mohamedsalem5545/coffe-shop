import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? url;
  @override
  void initState() {
    getSavedImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundImage: url != null ? NetworkImage(url!) : null,
      ),
    );
  }

  void getSavedImage() async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();

    setState(() {
      url =
          sharePreference.getString(FirebaseAuth.instance.currentUser!.email!);
    });
  }
}
