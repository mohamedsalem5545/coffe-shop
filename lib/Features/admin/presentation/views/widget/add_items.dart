// import 'package:bookly/Features/person/presentation/view/widgets/cirular_avater.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as p;
// import 'package:shared_preferences/shared_preferences.dart';

// class AddItems extends StatefulWidget {
//   late String? catagoryId;
//   late String? imagUrl;

//   AddItems({super.key, this.catagoryId, this.imagUrl});

//   @override
//   State<AddItems> createState() => _AddItemsState();
// }

// class _AddItemsState extends State<AddItems> {
//   // MyHomePage({super.key,  });
//   final TextEditingController _field1Controller = TextEditingController();

//   final TextEditingController _field2Controller = TextEditingController();

//   final TextEditingController _field3Controller = TextEditingController();

//   // Initialize Firestore
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Function to add data to Firestore

//   Future<void> _addDocument() async {
//     try {
//       String documentId = _field1Controller.text.toString();
//       // String catagoryId = x;
//       print('8888888888888888888888888${widget.imagUrl}');
//       await _firestore.collection(widget.catagoryId!).doc(documentId).set({
//         'title': _field1Controller.text,
//         'des': _field2Controller.text,
//         'ptice': _field3Controller.text,
//         'image': '${widget.imagUrl}',
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Document added to Firestore'),
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error adding document: $e'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add items'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const CircularAvaterView(),
//             TextField(
//               controller: _field1Controller,
//               decoration: const InputDecoration(labelText: 'name item'),
//             ),
//             TextField(
//               controller: _field2Controller,
//               decoration: const InputDecoration(labelText: 'describation'),
//             ),
//             TextField(
//               controller: _field3Controller,
//               decoration: const InputDecoration(labelText: 'price'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _addDocument,
//               child: const Text('Add'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CircularAvaterView extends StatefulWidget {
//   const CircularAvaterView({
//     super.key,
//   });

//   @override
//   State<CircularAvaterView> createState() => _CircularAvaterViewState();
// }

// class _CircularAvaterViewState extends State<CircularAvaterView> {
//   File? image;
//   String? imagUrl;
//   String? url;

//   @override
//   void initState() {
//     super.initState();
//     getSavedImage();
//     //  url =  getSavedImage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("0000000000000000000$imagUrl");
//     print("00000000000000011111111$url");
//     // AddItems(
//     //   imagUrl: url,
//     // );
//     print('#####################3$url');

//     return Stack(
//       alignment: Alignment.bottomRight,
//       children: [
//         CircleAvatar(
//           radius: 62,
//           //  backgroundColor: Colors.white,
//           child: CircleAvatar(
//               radius: 60,
//               backgroundImage: url == null ? null : NetworkImage(url ?? '')),
//         ),
//         CircleAvatar(
//           radius: 25,
//           backgroundColor: const Color(0xfff5f6f9),
//           //  child: Image.asset(''),
//           child: Center(
//               child: IconButton(
//             onPressed: () {
//               pickImageGallery();

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AddItems(imagUrl: url ?? ''),
//                 ),
//               );
//               //setState(() {});
//             },
//             icon: Icon(
//               Icons.camera_alt_outlined,
//               color: Colors.black.withOpacity(0.3),
//             ),
//           )),
//         )
//       ],
//     );
//   }

//   void pickImageGallery() async {
//     var img = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (img != null) {
//       image = File(img.path);
//       uploadimage(img);
//     }
//   }

//   void uploadimage(var img) async {
//     if (img != null) {
//       var storageRef =
//           FirebaseStorage.instance.ref().child(p.basename(img.path));
//       await storageRef.putFile(image!);
//       imagUrl = await storageRef.getDownloadURL();
//       saveImageUrl(imagUrl!, 'ahmed@gamil.com');
//       getSavedImage();
//       setState(() {});
//     }
//   }

//   void saveImageUrl(String url, String userEmail) async {
//     SharedPreferences sharePreference = await SharedPreferences.getInstance();
//     sharePreference.remove(userEmail);
//     await sharePreference.setString(userEmail, url);
//   }

//   void getSavedImage() async {
//     SharedPreferences sharePreference = await SharedPreferences.getInstance();

//     setState(() {
//       url = sharePreference.getString('ahmed@gamil.com');
//     });
//   }
// }
import 'dart:io';
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
  State<AddItems> get createState => _AddItemsState();
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

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Document added to Firestore'),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding document: e'),
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
        title: const Text('Add items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircularAvaterView(
              ontap: () async {
                finalUrl = await pickImageGallery();
                setState(() {});
              },
              imageUrl: imagUrl ?? imagUrl,
            ),
            TextField(
              controller: _field1Controller,
              decoration: const InputDecoration(labelText: 'name item'),
            ),
            TextField(
              controller: _field2Controller,
              decoration: const InputDecoration(labelText: 'description'),
            ),
            TextField(
              controller: _field3Controller,
              decoration: const InputDecoration(labelText: 'price'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: (() {
                addDocument();
              }),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> pickImageGallery() async {
    String imUrl = 'no data';
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img != null) {
      image = File(img.path);
      imUrl = await uploadimage(img);
    }
    print('imUrl= $imUrl');
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
