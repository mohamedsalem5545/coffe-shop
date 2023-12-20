import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
      alignment: Alignment.bottomRight,
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
        Row(
          children: [
            SizedBox(
              // width: 90,
              width: MediaQuery.of(context).size.width * .25,
            ),
            Center(
                child: IconButton(
              onPressed: () {
                pickImageCamera();
                setState(() {});
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 28,
                // color: Colors.black.withOpacity(0.3),
                color: Colors.orangeAccent,
              ),
            )),
            SizedBox(
              // width: 55,
              width: MediaQuery.of(context).size.width * .14,
            ),
            Center(
                child: IconButton(
              onPressed: () {
                pickImageGallery();
                setState(() {});
              },
              icon: const Icon(
                Icons.collections,
                size: 28,
                //color: Colors.black.withOpacity(0.3),
                color: Colors.orangeAccent,
              ),
            ))
          ],
        ),
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
}
