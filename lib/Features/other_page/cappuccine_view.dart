import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    for (var element in responsbody.docs) {
      setState(() {
        cappuccines.add(element.data());
        totalProductList.add(element.data());
      });
    }
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
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orangeAccent,
            )),
        centerTitle: true,
        title: const Text('Cappuccine '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: ProductSearch(product: cappuccines));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.orangeAccent,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.orangeAccent,
              ))
        ],
      ),
      body: cappuccines.isNotEmpty
          ? ListView.builder(
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
              }))
          : const SizedBox(
              height: 600,
              child: Center(
                child: SpinKitThreeInOut(
                  color: Colors.grey, // Set the color of the animation
                  size: 50.0, // Set the size of the animation
                ),
              ),
            ),
    );
  }
}
