import 'package:bookly/Features/admin/presentation/views/widget/add_items.dart';

import 'package:flutter/material.dart';
import 'package:bookly/Features/admin/presentation/views/widget/delet_item.dart';
import 'package:bookly/Features/admin/presentation/views/widget/update_items.dart';

class ChoiseItems extends StatefulWidget {
  String action;
  ChoiseItems({super.key, required this.action});

  @override
  _ChoiseItemsState createState() => _ChoiseItemsState();
}

class _ChoiseItemsState extends State<ChoiseItems> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orangeAccent),
        title: const Text('Choose any category'),
      ),
      body: ListView(
        children: [
          buildCheckboxListTile('tea'),
          buildCheckboxListTile('coffee'),
          buildCheckboxListTile('cappuccino'),
          buildCheckboxListTile('latte'),
          buildCheckboxListTile('Special'),
          buildCheckboxListTile('for you'),
          // Add more options as needed
        ],
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile(String option) {
    return CheckboxListTile(
      title: Text(
        option,
        style: const TextStyle(color: Colors.orangeAccent),
      ),
      activeColor: Colors.orangeAccent,
      value: selectedOptions.contains(option),
      onChanged: (bool? value) {
        setState(() {
          if (value != null) {
            if (value) {
              selectedOptions.add(option);
            } else {
              selectedOptions.remove(option);
            }
          }
        });

        // Add the following line to clear the check mark after a brief delay
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            selectedOptions.remove(option);
          });
        });

        // The code below is the original code for navigation. I've moved it here so that it's executed after clearing the check mark.
        if (widget.action == 'Add') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return AddItems(
                  catagoryId: option,
                );
              }),
            ),
          );
        } else if (widget.action == 'Update') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return UpdateItem(
                  catogryId: option,
                );
              }),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return DeletItems(
                  catogryId: option,
                );
              }),
            ),
          );
        }
      },
    );
  }
}
