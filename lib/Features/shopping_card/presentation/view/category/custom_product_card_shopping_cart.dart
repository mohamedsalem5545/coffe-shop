import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ProductShoppingCardItem extends StatefulWidget {
  String text;
  String subtext;

  String url;
  String price;
  final int numberOfPices;
  final int index;

  ProductShoppingCardItem(
      {super.key,
      required this.text,
      required this.subtext,
      required this.url,
      required this.price,
      required this.numberOfPices,
      required this.index});

  @override
  State<ProductShoppingCardItem> createState() =>
      _ProductShoppingCardItemState();
}

class _ProductShoppingCardItemState extends State<ProductShoppingCardItem> {
  int prodctNumber = 0;
  bool bo = true;
  @override
  Widget build(BuildContext context) {
    // var text ;
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.white.withOpacity(.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 140,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 15,
              width: 15,
              child: GestureDetector(
                onTap: () {
                  if (bo == true) {
                    BlocProvider.of<GetShoppingCardProducts>(context)
                        .deleteProductById( widget.text);
                    //    print(shoppingProductList[widget.index]);
                    //  shoppingProductList.removeAt(widget.numberOfPices);
                    bo = false;

                    // setState(() {});

                    // BlocProvider.of<DeleteCubit>(context).removeProductPrice(
                    //     widget.numberOfPices, int.parse(widget.price));
                  }
                },
                child: const Icon(
                  Icons.close,
                  size: 15,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        image: widget.url[0] == 'h'
                            ? DecorationImage(
                                image: NetworkImage(widget.url),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: AssetImage(widget.url),
                                fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        widget.text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("\$ ",
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(widget.price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      //  mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("pices",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 80,
                        ),
                        Text(widget.numberOfPices.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
