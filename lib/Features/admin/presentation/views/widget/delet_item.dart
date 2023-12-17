import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeletItems extends StatefulWidget {
 final String catogryId;

 const DeletItems({super.key, required this.catogryId});

  @override
  State<DeletItems> createState() => _DeletItemsState();
}

class _DeletItemsState extends State<DeletItems> {
  final TextEditingController _field1Controller = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void deleteDocument() async {
    // Replace 'your_collection' with the name of your collection and 'your_document_id' with the ID of the document you want to delete.
    try {
      DocumentReference documentReference =
          _firestore.collection(widget.catogryId).doc(_field1Controller.text);

      await documentReference.delete();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Document deleted successfully!'),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding document: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        title: const Text('Delete items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.orangeAccent,
              controller: _field1Controller,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .orangeAccent), // Set the color of the underline when focused
                  ),
                  labelText: 'name item',
                  labelStyle: TextStyle(color: Colors.orangeAccent)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.orangeAccent), // Set the background color
              ),
              onPressed: (() {
                // print('start data');
                deleteDocument();
              }),
              child: const Text(
                'Delet',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
