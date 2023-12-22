import 'dart:io';

import 'package:bookly/Features/admin/presentation/views/widget/custom_text_field.dart';
import 'package:path/path.dart' as p;
import 'package:bookly/Features/admin/presentation/views/widget/add_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddItems extends StatefulWidget {
  final String catagoryId;

  const AddItems({
    super.key,
    required this.catagoryId,
  });

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDocument() async {
    try {
      String documentId = _field1Controller.text.toString();
      await _firestore.collection(widget.catagoryId).doc(documentId).set({
        'title': _field1Controller.text,
        'des': _field2Controller.text,
        'price': _field3Controller.text,
        'image': imagUrl,
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Document added to Firestore',
            // style: TextStyle(color: Colors.orangeAccent),
          ),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error adding document: $e',
            // style: TextStyle(color: Colors.orangeAccent),
          ),
        ),
      );
    }
    //}
  }

  File? image;
  String? imagUrl;
  String? url;
  String? finalUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        title: const Text('Add items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: CircularAvaterView(
                ontap: () async {
                  finalUrl = await pickImageGallery();
                  setState(() {});
                },
                imageUrl: imagUrl ?? imagUrl,
              ),
            ),
            CustomTextField(
                fieldController: _field1Controller, title: 'name item'),
            CustomTextField(
                fieldController: _field2Controller, title: 'description'),
            CustomTextField(fieldController: _field3Controller, title: 'price'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.orangeAccent), // Set the background color
              ),
              onPressed: (() {
                // print('start data');
                addDocument();
              }),
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> pickImageGallery() async {
    String imUrl = 'no data';
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = File(img.path);
      imUrl = await uploadimage(img);
    }
    return imUrl;
  }

  Future<String> uploadimage(var img) async {
    if (img != null) {
      var storageRef =
          FirebaseStorage.instance.ref().child(p.basename(img.path));
      await storageRef.putFile(image!);
      imagUrl = await storageRef.getDownloadURL();
      // AddItems(
      //   imagUrl: imagUrl,
      // );

      //  saveImageUrl(imagUrl!, 'ahmed@gamil.com');
      // getSavedImage();
      setState(() {});
    }
    return imagUrl!;
  }
}
