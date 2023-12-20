import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TeaView extends StatefulWidget {
  const TeaView({super.key});
  @override
  State<TeaView> createState() => _TeaViewState();
}

class _TeaViewState extends State<TeaView> {
  List teas = [];
  CollectionReference tearef = FirebaseFirestore.instance.collection('tea');
  getDate() async {
    var responsbody = await tearef.get();
    for (var element in responsbody.docs) {
      setState(() {
        teas.add(element.data());
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
        title: const Text('Tea '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: ProductSearch(product: teas));
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
              )),
        ],
      ),
      body: teas.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: teas.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'detailspage', (route) => false);
                  },
                  child: ItemSpecial(
                    text: '${teas[index]['title']}',
                    subtext: '${teas[index]['des']}',
                    url: '${teas[index]['image']}',
                    price: '${teas[index]['price']}',
                  ),
                  //   }),
                  // ),
                );
              }),
            )
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
