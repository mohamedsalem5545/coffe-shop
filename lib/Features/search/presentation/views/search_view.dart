import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate {
  List product;
  ProductSearch({required this.product});

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
    List flitter = product.where((element) {
      return element['title']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
      // element['title'].contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: query == "" ? product.length : flitter.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('detailspage', (route) => false);
          },

          child: ItemSpecial(
            text: query == ""
                ? '${product[index]['title']}'
                : '${flitter[index]['title']}',
            subtext: query == ""
                ? '${product[index]['des']}'
                : '${flitter[index]['des']}',
            url: query == ""
                ? '${product[index]['image']}'
                : '${flitter[index]['image']}',
            price: query == ""
                ? '${product[index]['price']}'
                : '${flitter[index]['price']}',
          ),
          //   }),
          // ),
        );
      }),
    );
  }
}
