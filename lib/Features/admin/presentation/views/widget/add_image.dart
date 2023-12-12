import 'dart:io';

import 'package:bookly/Features/admin/presentation/views/widget/add_items.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class CircularAvaterView extends StatefulWidget {
  const CircularAvaterView({
    super.key,
  });

  @override
  State<CircularAvaterView> createState() => _CircularAvaterViewState();
}

class _CircularAvaterViewState extends State<CircularAvaterView> {
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
    print("0000000000000000000$imagUrl");
    print("00000000000000011111111$url");
    if (imagUrl != null) {
      AddItems(
        imagUrl: imagUrl,
      );
      print('877877877$imagUrl');
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 62,
          //  backgroundColor: Colors.white,
          child: CircleAvatar(
              radius: 60,
              backgroundImage: url == null ? null : NetworkImage(url!)),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xfff5f6f9),
          //  child: Image.asset(''),
          child: Center(
              child: IconButton(
            onPressed: () {
              pickImageGallery();
              setState(() {});
            },
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.black.withOpacity(0.3),
            ),
          )),
        )
      ],
    );
  }

  void pickImageGallery() async {
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
      // AddItems(
      //   imagUrl: imagUrl,
      // );

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
