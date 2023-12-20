import 'dart:io';

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
            radius: 62,
            //  backgroundColor: Colors.white,
            child: CircleAvatar(
                radius: 60,
                backgroundImage: url == null ? null : NetworkImage(url!)),
          ),
        ),
        // SizedBox(
        //   height: 50,
        // ),
        Positioned(
          bottom: -.5,
          right: 90,
          child: CircleAvatar(
            radius: 18,
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
      saveImageUrl(imagUrl!, 'ahmed@gamil.com');
      getSavedImage();
      setState(() {});
    }
  }

  void saveImageUrl(String url, String userEmail) async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();
    sharePreference.remove(userEmail);
    await sharePreference.setString(userEmail, url);
  }

  void getSavedImage() async {
    SharedPreferences sharePreference = await SharedPreferences.getInstance();

    setState(() {
      url = sharePreference.getString('ahmed@gamil.com');
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 90,
          width: double.infinity,
          //  padding: EdgeInsets.all(16),
          child: Row(
            //   mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text('This is a bottom sheet'),
              // SizedBox(height: 16),
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
