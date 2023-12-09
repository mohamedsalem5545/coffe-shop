// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bookly/Features/details/presentation/details_view.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemForYou extends StatefulWidget {
  const ItemForYou({
    super.key,
  });

  @override
  State<ItemForYou> createState() => _ItemForYouState();
}

class _ItemForYouState extends State<ItemForYou> {
  List forYous = [];

  CollectionReference tearef = FirebaseFirestore.instance.collection('for you');
  getDate() async {
    var responsbody = await tearef.get();
    responsbody.docs.forEach((element) {
      setState(() {
        forYous.add(element.data());
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * .33,
      // width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: forYous.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context)
              //     .pushNamedAndRemoveUntil('detailspage', (route) => false);
              // Navigator.pushNamed(context, 'detailspage');
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailsView(
                    title: '${forYous[index]['title']}',
                    des: '${forYous[index]['des']}',
                    image: '${forYous[index]['image']}',
                    price: '${forYous[index]['price']}');
              }));
            },
            child: Card(
              elevation: 20,
              color: Colors.white.withOpacity(.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(right: 20),
              child: Container(
                padding: const EdgeInsets.all(15),
                width: 155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Image(
                              image: AssetImage('${forYous[index]['image']}'),
                              // image: AssetImage(''${others[index]['image']}''),
                              fit: BoxFit.cover,
                            )),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 25,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.7),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 14,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${forYous[index]['title']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('with Oat Milk',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.5),
                          fontSize: 15,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: Row(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text("\$ ",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text('${forYous[index]['price']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
