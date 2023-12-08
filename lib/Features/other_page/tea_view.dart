import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    responsbody.docs.forEach((element) {
      setState(() {
        teas.add(element.data());
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
        title: const Text('Tea '),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: ProductSearch(product: teas));
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: teas.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('detailspage', (route) => false);
            },
            // child: ListView.builder(
            //   itemCount: teas.length,
            //   itemBuilder: ((context, i) {
            //     print('#################===$i');
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
      ),
    );
  }
}
