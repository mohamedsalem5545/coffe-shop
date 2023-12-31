import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LatteView extends StatefulWidget {
  const LatteView({super.key});

  @override
  State<LatteView> createState() => _LatteViewState();
}

class _LatteViewState extends State<LatteView> {
  List lattes = [];

  CollectionReference tearef = FirebaseFirestore.instance.collection('late');
  getDate() async {
    var responsbody = await tearef.get();
    for (var element in responsbody.docs) {
      setState(() {
        lattes.add(element.data());
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
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0),
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
        title: const Text('Latte '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: ProductSearch(product: lattes));
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
      body: lattes.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: lattes.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'detailspage', (route) => false);
                  },
                  child: ItemSpecial(
                    text: '${lattes[index]['title']}',
                    subtext: '${lattes[index]['des']}',
                    url: '${lattes[index]['image']}',
                    price: '${lattes[index]['price']}',
                  ),
                );
              }))
          : const SizedBox(
              height: 600,
              child: Center(
                child: SpinKitThreeInOut(
                  color: Colors.grey,
                  size: 50.0,
                ),
              ),
            ),
    );
  }
}
