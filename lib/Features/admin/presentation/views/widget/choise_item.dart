import 'package:bookly/Features/admin/presentation/views/widget/add_items.dart';
import 'package:flutter/material.dart';

class ChoiseItems extends StatefulWidget {
  const ChoiseItems({super.key});

  @override
  _ChoiseItemsState createState() => _ChoiseItemsState();
}

class _ChoiseItemsState extends State<ChoiseItems> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose any category  to add'),
      ),
      body: ListView(
        children: [
          buildCheckboxListTile('tea'),
          buildCheckboxListTile('coffe'),
          buildCheckboxListTile('cappuccine'),
          buildCheckboxListTile('late'),

          buildCheckboxListTile('Special'),
          buildCheckboxListTile('for you'),

          // Add more options as needed
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Perform actions based on selected options
          print('Selected Options: $selectedOptions');
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile(String option) {
    return CheckboxListTile(
      title: Text(option),
      value: selectedOptions.contains(option),
      onChanged: (bool? value) {
        setState(() {
          if (value != null) {
            if (value) {
              selectedOptions.add(option);
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
            } else {
              selectedOptions.remove(option);
            }
          }
        });
      },
    );
  }
}
