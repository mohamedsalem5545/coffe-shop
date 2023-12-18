// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bookly/Features/home/presentation/views/widgets/custom_for_you_item.dart';
import 'package:bookly/Features/search/presentation/views/widgets/total_search.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  late List<Widget> itemList;
  @override
  void initState() {
    getDate();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .33,
      // width: double.infinity,
      child: forYous.isNotEmpty
          ? CarouselSlider(
              items: [
                  for (int i = 0; i < forYous.length; i++)
                    CustomForYouItem(
                      title: forYous[i]['title'],
                      price: forYous[i]['price'],
                      des: forYous[i]['des'],
                      image: forYous[i]['image'],
                    ),
                ],
              options: CarouselOptions(
                height: 400,
                scrollPhysics: const BouncingScrollPhysics(),
                //   aspectRatio: 16 / 9,
                viewportFraction: 0.51,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                //   enlargeFactor: 0.3,
                //  onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ))
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


