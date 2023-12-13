import 'dart:io';

// 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart' as p;
//import 'package:shared_preferences/shared_preferences.dart';

class CircularAvaterView extends StatefulWidget {
  const CircularAvaterView({super.key, this.ontap, this.imageUrl});
  final void Function()? ontap;
  final String? imageUrl;
  @override
  State<CircularAvaterView> createState() => _CircularAvaterViewState();
}

class _CircularAvaterViewState extends State<CircularAvaterView> {
  // File? image;
  // String? imagUrl;
  // String? url;
  // String? finalUrl;
  @override
  void initState() {
    super.initState();
    //getSavedImage();
    //  url =  getSavedImage();
  }

  @override
  Widget build(BuildContext context) {
    // print("0000000000000000000$imagUrl");
    // print("00000000000000011111111$url");
    // if (finalUrl != null) {
    //   // AddItems(
    //   //   imagUrl: 'finalUrl',

    //   // );
    //   print('877877877$imagUrl');
    // }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 62,
          //  backgroundColor: Colors.white,
          child: widget.imageUrl != null
              ? CircleAvatar(
                  radius: 60, backgroundImage: NetworkImage(widget.imageUrl!))
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/s3.jpg'),
                ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xfff5f6f9),
          //  child: Image.asset(''),
          child: Center(
              child: IconButton(
            onPressed: widget.ontap,
            //  () async {
            //   finalUrl = await pickImageGallery();
            //   setState(() {});
            // },
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.black.withOpacity(0.3),
            ),
          )),
        )
      ],
    );
  }

  // Future<String> pickImageGallery() async {
  //   String imUrl = 'no data';
  //   var img = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (img != null) {
  //     image = File(img.path);
  //     imUrl = await uploadimage(img);
  //   }
  //   print('imUrl= $imUrl');
  //   return imUrl;
  // }

  // Future<String> uploadimage(var img) async {
  //   if (img != null) {
  //     var storageRef =
  //         FirebaseStorage.instance.ref().child(p.basename(img.path));
  //     await storageRef.putFile(image!);
  //     imagUrl = await storageRef.getDownloadURL();
  //     // AddItems(
  //     //   imagUrl: imagUrl,
  //     // );

  //     //  saveImageUrl(imagUrl!, 'ahmed@gamil.com');
  //     // getSavedImage();
  //     setState(() {});
  //   }
  //   print('imagUrl= $imagUrl');
  //   return imagUrl!;
  // }

  // void saveImageUrl(String url, String userEmail) async {
  //   SharedPreferences sharePreference = await SharedPreferences.getInstance();
  //   sharePreference.remove(userEmail);
  //   await sharePreference.setString(userEmail, url);
  // }

  // void getSavedImage() async {
  //   SharedPreferences sharePreference = await SharedPreferences.getInstance();

  //   setState(() {
  //     url = sharePreference.getString('ahmed@gamil.com');
  //   });
  // }
}
