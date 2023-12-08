import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CappuccineView extends StatefulWidget {
  const CappuccineView({super.key});

  @override
  State<CappuccineView> createState() => _CappuccineViewState();
}

class _CappuccineViewState extends State<CappuccineView> {
  List cappuccines = [];

  CollectionReference tearef =
      FirebaseFirestore.instance.collection('cappuccine');
  getDate() async {
    var responsbody = await tearef.get();
    responsbody.docs.forEach((element) {
      setState(() {
        cappuccines.add(element.data());
        totalProductList.add(element.data());
      });
    });
  }

  @override
  void initState() {
    getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('homepage', (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Text('Cappuccine '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductSearch(product: cappuccines));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: cappuccines.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'detailspage');
              },
              child: ItemSpecial(
                text: '${cappuccines[index]['title']}',
                subtext: '${cappuccines[index]['des']}',
                url: '${cappuccines[index]['image']}',
                price: '${cappuccines[index]['price']}',
              ),
            );
          })),
    );
  }
}
