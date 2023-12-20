// import 'package:bookly/Features/admin/presentation/views/widget/add_items.dart';
// import 'package:bookly/Features/admin/presentation/views/widget/choise_item.dart';
// import 'package:flutter/material.dart';

// class ChoiseAction extends StatefulWidget {
//   // String catogory;
//   ChoiseAction({super.key});

//   @override
//   _ChoiseActionState createState() => _ChoiseActionState();
// }

// class _ChoiseActionState extends State<ChoiseAction> {
//   List<String> selectedOptions = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Choose  you action'),
//       ),
//       body: ListView(
//         children: [
//           buildCheckboxListTile('Add'),
//           buildCheckboxListTile('Update'),
//           buildCheckboxListTile('Delet'),

//           // Add more options as needed
//         ],
//       ),
//     );
//   }

//   CheckboxListTile buildCheckboxListTile(String option) {
//     return CheckboxListTile(
//       title: Text(
//         option,
//         style: const TextStyle(color: Colors.orangeAccent),
//       ),
//       activeColor: Colors.orangeAccent,
//       // autofocus: true,
//       value: selectedOptions.contains(option),
//       onChanged: (bool? value) {
//         setState(() {
//           if (value != null) {
//             if (value) {
//               //Colors.yellowAccent;

//               selectedOptions.add(option);

//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: ((context) {
//                     return ChoiseItems(
//                       action: option,
//                     );
//                   }),
//                 ),
//               );
//             } else {
//               selectedOptions.remove(option);
//             }
//           }
//         });
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:bookly/Features/admin/presentation/views/widget/choise_item.dart';

class ChoiseAction extends StatefulWidget {
  const ChoiseAction({super.key});

  @override
  State<ChoiseAction> createState() => _ChoiseActionState();
}

class _ChoiseActionState extends State<ChoiseAction> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Choose your action'),
      ),
      body: ListView(
        children: [
          buildCheckboxListTile('Add'),
          buildCheckboxListTile('Update'),
          buildCheckboxListTile('Delete'),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            // style: ButtonStyle(

            //   backgroundColor: MaterialStateProperty.all<Color>(
            //       Colors.orangeAccent), // Set the background color
            // ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(20, 40.0),
              backgroundColor: Colors.orangeAccent,
            ),

            onPressed: (() {
              // print('start data');
              Navigator.pushNamed(context, 'homepage');
            }),
            child: const Text(
              'Go Home',
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),

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

              // Add the following line to clear the check mark after a brief delay
              Future.delayed(const Duration(milliseconds: 300), () {
                setState(() {
                  selectedOptions.remove(option);
                });
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return ChoiseItems(
                      action: option,
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
