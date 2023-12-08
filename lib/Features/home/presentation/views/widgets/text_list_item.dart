import 'package:bookly/Features/home/presentation/views/widgets/text_item.dart';
import 'package:flutter/material.dart';

class TextListView extends StatefulWidget {
  const TextListView({super.key});

  @override
  State<TextListView> createState() => _TextListViewState();
}

class _TextListViewState extends State<TextListView> {
  static int currentIndex = 0;

  List<String> textList = [
    'For You',
    'coffe',
    'tea',
    'cappuccine',
    'latte',
    'others',
  ];
  @override
  Widget build(BuildContext context) {
    //print('***************************$currentIndex');
    return ListView.builder(
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: textList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              currentIndex = index;
           //   print('**************************$index');
              if (index == 0) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('homepage', (route) => false);
                // Navigator.pushNamed(context, 'homepage');
                // Navigator.pushNamed(context, '/second');
              } else if (index == 1) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('coffepage', (route) => false);
                // Navigator.pushNamed(context, 'coffepage');
              } else if (index == 2) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('teapage', (route) => false);
              } else if (index == 3) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    'cappuccinepage', (route) => false);
              } else if (index == 4) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('lattepage', (route) => false);
              } else {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('otherpage', (route) => false);
              }

              setState(() {});
              // //item = currentIndex;
              // setState(() {});
              //getState(currentIndex);
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('search', (route) => false);
            },
            child: TextItem(
              text: textList[index],
              isActive: currentIndex == index,
            ),
          ),
        );
      },
    );
  }
}
