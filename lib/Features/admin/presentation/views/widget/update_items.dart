import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateItem extends StatefulWidget {
  String catogryId;
  UpdateItem({super.key, required this.catogryId});

  @override
  State<UpdateItem> createState() => _UpdateItemState();
}

class _UpdateItemState extends State<UpdateItem> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  final TextEditingController _field3Controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // String catogryId;
  void updateField() async {
    // Replace 'your_collection' with the name of your collection and 'your_document_id' with the ID of your document.
    try {
      DocumentReference documentReference =
          _firestore.collection(widget.catogryId).doc(_field1Controller.text);

      // Replace 'field_to_update' with the name of the field you want to update.
      // Replace 'new_value' with the new value you want to set for the field.
      Map<String, dynamic> dataToUpdate = {
        _field2Controller.text: _field3Controller.text
      };

      await documentReference.update(dataToUpdate);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Field updated successfully'),
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
        title: const Text('Update items'),
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
            TextField(
              cursorColor: Colors.orangeAccent,
              controller: _field2Controller,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .orangeAccent), // Set the color of the underline when focused
                  ),
                  labelText: 'name field',
                  labelStyle: TextStyle(color: Colors.orangeAccent)),
            ),
            TextField(
              cursorColor: Colors.orangeAccent,
              controller: _field3Controller,
              decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .orangeAccent), // Set the color of the underline when focused
                  ),
                  labelText: 'new value for field',
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
                updateField();
              }),
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
