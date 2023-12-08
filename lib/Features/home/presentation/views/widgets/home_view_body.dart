// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bookly/Features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:bookly/Features/home/presentation/views/widgets/item_special.dart';
import 'package:bookly/Features/home/presentation/views/widgets/list_item_for_you.dart';
import 'package:bookly/Features/home/presentation/views/widgets/profile.dart';
import 'package:bookly/Features/home/presentation/views/widgets/text_list_item.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List specials = [];

  CollectionReference tearef = FirebaseFirestore.instance.collection('special');
  getDate() async {
    var responsbody = await tearef.get();
    responsbody.docs.forEach((element) {
      setState(() {
        specials.add(element.data());
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // physics: const BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [CustomDrawer(), Profile()],
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Find the Drink",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Coffee for you",
                  style: TextStyle(
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 25,
                width: double.infinity,
              ),
              //CustomTextForm(),
              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: TotalSearch(),
                  );
                },
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.coffee,
                        color: Colors.white.withOpacity(.3),
                      ),
                      label: const Text('Find Your Coff'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
                child: TextListView(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: ItemForYou()),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Text(
                    "special offers",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 15,
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: specials.length, (context, index) {
                  return ItemSpecial(
                    text: '${specials[index]['title']}',
                    subtext: '${specials[index]['des']}',
                    url: '${specials[index]['image']}',
                    price: '${specials[index]['price']}',
                  );
                }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
