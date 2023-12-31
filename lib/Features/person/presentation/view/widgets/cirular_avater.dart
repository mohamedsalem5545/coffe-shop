import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class Addimage extends StatefulWidget {
  const Addimage({
    super.key,
  });

  @override
  State<Addimage> createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  File? image;
  String? imagUrl;
  String? url;

  @override
  void initState() {
    super.initState();
    getSavedImage();
    //  url =  getSavedImage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //alignment: Alignment.topRight,
      children: [
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.orangeAccent,
            radius: MediaQuery.of(context).size.width * 0.153,
            //  backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.15,
                backgroundImage: url == null ? null : NetworkImage(url!)),
          ),
        ),
        // SizedBox(
        //   height: 50,
        // ),
        Positioned(
          bottom: 0,
          right: MediaQuery.of(context).size.width * 0.295,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: const Color(0xfff5f6f9),
            //  child: Image.asset(''),
            child: Center(
              child: IconButton(
                onPressed: () {
                  _showBottomSheet(context);
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void pickImageGallery() async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = File(img.path);
      uploadimage(img);
    }
  }

  void pickImageCamera() async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img != null) {
      image = File(img.path);
      uploadimage(img);
    }
  }

  void uploadimage(var img) async {
    if (img != null) {
      var storageRef =
          FirebaseStorage.instance.ref().child(p.basename(img.path));
      await storageRef.putFile(image!);
      imagUrl = await storageRef.getDownloadURL();
      saveImageUrl(imagUrl!);
      getSavedImage();

      ///setState(() {});
    }
  }

  void saveImageUrl(String url) async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();
    sharePreference.remove(FirebaseAuth.instance.currentUser!.email!);
    await sharePreference.setString(
        FirebaseAuth.instance.currentUser!.email!, url);
  }

  void getSavedImage() async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();

    setState(() {
      url =
          sharePreference.getString(FirebaseAuth.instance.currentUser!.email!);
    });
    // url = sharePreference.getString(FirebaseAuth.instance.currentUser!.email!);
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 90,
          width: double.infinity,
          //  padding: EdgeInsets.all(16),
          child: Row(
            //   mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text('This is a bottom sheet'),
              IconButton(
                onPressed: () {
                  pickImageCamera();
                },
                icon: const Icon(
                  FontAwesomeIcons.camera,
                  color: Colors.orangeAccent,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  pickImageGallery();
                  // Close the bottom sheet
                },
                icon: const Icon(
                  Icons.collections,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(
                //width: 170,
                width: MediaQuery.of(context).size.width * .53,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  color: Colors.orangeAccent,
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
