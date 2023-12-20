import 'package:bookly/Features/home/presentation/views/widgets/text_item.dart';
import 'package:flutter/material.dart';

class TextListView extends StatefulWidget {
  const TextListView({super.key});

  @override
  State<TextListView> createState() => _TextListViewState();
}

class _TextListViewState extends State<TextListView> {
  int currentIndex = 0; // Non-static, instance variable

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
    return ListView.builder(
      itemCount: textList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });

              navigateToPage(context, index);
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

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('homepage', (route) => false);
        break;
      case 1:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('coffepage', (route) => false);
        break;
      case 2:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('teapage', (route) => false);
        break;
      case 3:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('cappuccinepage', (route) => false);
        break;
      case 4:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('lattepage', (route) => false);
        break;
      default:
        Navigator.of(context)
            .pushNamedAndRemoveUntil('otherpage', (route) => false);
    }
  }
}
