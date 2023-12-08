// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';

// // class LoodImage extends StatefulWidget {
// //   const LoodImage({
// //     super.key,
// //   });

// //   @override
// //   State<LoodImage> createState() => _LoodImageState();
// // }

// // class _LoodImageState extends State<LoodImage> {
// //   File? file;
// //   getImage() async {
// //     final ImagePicker picker = ImagePicker();
// // // Pick an image.
// //     // final XFile? imagegallery =
// //     //     await picker.pickImage(source: ImageSource.gallery);
// // // Capture a photo.
// //     final XFile? imageCamer =
// //         await picker.pickImage(source: ImageSource.camera);
// //     if (imageCamer != null) {
// //       file = File(imageCamer!.path);
// //     }
// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Container(
// //         alignment: Alignment.topCenter,
// //         width: 150,
// //         height: 150,
// //         decoration: BoxDecoration(
// //           color: Colors.grey[200],
// //           borderRadius: BorderRadius.zero,
// //         ),
// //         child: Column(
// //           children: [
// //             if (file != null)
// //               Image.file(
// //                 file!,
// //                 height: 100,
// //                 width: 100,
// //                 fit: BoxFit.fill,
// //               ),
// //             // SizedBox(
// //             //   height: 20,
// //             // ),
// //             Align(
// //               alignment: Alignment.center,
// //               child: IconButton(
// //                 onPressed: () async {
// //                   await getImage();
// //                 },
// //                 icon: Icon(
// //                   // fill: 50,
// //                   Icons.image,
// //                   size: 50,
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_downloader/image_downloader.dart';


// main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   File? _image;
//   String? _url;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: _image == null ? null : FileImage(_image!),
//                   radius: 80,
//                 ),
//                 GestureDetector(onTap: pickImage, child: Icon(Icons.camera_alt))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Builder(
//                   builder: (context) => ElevatedButton(
//                     onPressed: () {
//                       uploadImage(context);
//                     },
//                     child: Text('Upload Image'),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: loadImage,
//                   child: Text('Load Image'),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   void pickImage() async {
//     var image = await ImagePicker.
//     //var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   void uploadImage(context) async {
//     try {
//       FirebaseStorage storage =
//           FirebaseStorage(storageBucket: 'gs://test-193e1.appspot.com');
//       StorageReference ref = storage.ref().child(_image.path);
//       StorageUploadTask storageUploadTask = ref.putFile(_image);
//       StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text('success'),
//       ));
//       String url = await taskSnapshot.ref.getDownloadURL();
//       print('url $url');
//       setState(() {
//         _url = url;
//       });
//     } catch (ex) {
//       Scaffold.of(context).showSnackBar(SnackBar(
//         content: Text(ex.message),
//       ));
//     }
//   }

//   void loadImage() async {
//     var imageId = await ImageDownloader.downloadImage(_url);
//     var path = await ImageDownloader.findPath(imageId);
//     File image = File(path);
//     setState(() {
//       _image = image;
//     });
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io';
// import 'package:path/path.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//    XFile? _image;

//   @override
//   Widget build(BuildContext context) {

//     Future getImage() async {
//       //var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//       final ImagePicker picker = ImagePicker();
// // Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.camera);


//       setState(() {
//         _image = image;
//           print('Image Path $_image');
//       });
//     }

//     Future uploadPic(BuildContext context) async{
//       String fileName = basename(_image!.path);
//       var reference = FirebaseStorage.instance.ref().child(fileName);
//        //StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
//        var uploadTask = reference.putFile(_image);
//        var taskSnapshot=await uploadTask.cancel();
//        setState(() {
//           print("Profile Picture uploaded");
//          // Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
//        });
//     }

//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               icon: Icon(FontAwesomeIcons.arrowLeft),
//               onPressed: () {
//                 Navigator.pop(context);
//               }),
//           title: Text('Edit Profile'),
//         ),
//         body: Builder(
//         builder: (context) =>  Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.center,
//                     child: CircleAvatar(
//                       radius: 100,
//                       backgroundColor: Color(0xff476cfb),
//                       child: ClipOval(
//                         child: new SizedBox(
//                           width: 180.0,
//                           height: 180.0,
//                           child: (_image!=null)?Image.file(
//                             _image??,
//                             fit: BoxFit.fill,
//                           ):Image.network(
//                             "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 60.0),
//                     child: IconButton(
//                       icon: Icon(
//                         FontAwesomeIcons.camera,
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         getImage();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
            
              
             
//             ],
//           ),
//         ),
//         ),
//         );
//   }
// }