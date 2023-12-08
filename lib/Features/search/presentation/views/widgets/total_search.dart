import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:flutter/material.dart';

List totalProductList = [];

class TotalSearch extends SearchDelegate {
  //TotalSearch({});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List flitter = totalProductList.where((element) {
      return element['title']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
      // element['title'].contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: query == "" ? totalProductList.length : flitter.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('detailspage', (route) => false);
          },

          child: ItemSpecial(
            text: query == ""
                ? '${totalProductList[index]['title']}'
                : '${flitter[index]['title']}',
            subtext: query == ""
                ? '${totalProductList[index]['des']}'
                : '${flitter[index]['des']}',
            url: query == ""
                ? '${totalProductList[index]['image']}'
                : '${flitter[index]['image']}',
            price: query == ""
                ? '${totalProductList[index]['price']}'
                : '${flitter[index]['price']}',
          ),
          //   }),
          // ),
        );
      }),
    );
  }
}
