import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

List others = [];

class OtherView extends StatefulWidget {
  const OtherView({super.key});

  @override
  State<OtherView> createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  CollectionReference tearef = FirebaseFirestore.instance.collection('other');
  getDate() async {
    var responsbody = await tearef.get();
    for (var element in responsbody.docs) {
      setState(() {
        others.add(element.data());
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
        title: const Text('Other'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: ProductSearch(product: others));
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
      body: others.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: others.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detailspage');
                  },
                  child: ItemSpecial(
                    text: '${others[index]['title']}',
                    subtext: '${others[index]['des']}',
                    //url: 'assets/images/other/Chai.jpeg',
                    url: '${others[index]['image']}',
                    price: '${others[index]['price']}',
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
