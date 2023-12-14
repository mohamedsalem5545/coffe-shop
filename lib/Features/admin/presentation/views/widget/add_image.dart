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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 150.0,
          height: 150.0,
          color: Colors.orangeAccent,
          child: widget.imageUrl != null
              ? Container(
                  width: 145.0,
                  height: 145.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget
                          .imageUrl!), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  width: 145.0,
                  height: 145.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/s3.jpg'), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
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
}
