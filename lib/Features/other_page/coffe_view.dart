import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CoffeView extends StatefulWidget {
  const CoffeView({super.key});

  @override
  State<CoffeView> createState() => _CoffeViewState();
}

class _CoffeViewState extends State<CoffeView> {
  List coffes = [];

  CollectionReference tearef = FirebaseFirestore.instance.collection('coffe');
  getDate() async {
    var responsbody = await tearef.get();
    responsbody.docs.forEach((element) {
      setState(() {
        coffes.add(element.data());
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
        title: const Text('Coffe '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: ProductSearch(product: coffes));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: coffes.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'detailspage');
              },
              child: ItemSpecial(
                text: '${coffes[index]['title']}',
                subtext: '${coffes[index]['des']}',
                url: '${coffes[index]['image']}',
                price: '${coffes[index]['price']}',
              ),
            );
          })),
    );
  }
}
