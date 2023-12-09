import 'package:bookly/Features/details/presentation/view/widgets/custom_app_bar_item.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_botton.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_continer_with_product_info.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_product_description.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_product_image.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_product_price_column.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_product_size_bottons.dart';
import 'package:bookly/Features/details/presentation/view/widgets/custom_productsize_text.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:bookly/core/utils/function/custom_shopping_list.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  final String title;
  final String des;
  final String image;
  final String price;
  //final int index;
  const DetailsView(
      {super.key,
      required this.title,
      required this.des,
      required this.image,
      required this.price});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  var s = true;

  var m = false;

  var l = true;

  int x = 1;
  int prodctNumber = 0;
  bool shopcard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        CustomProductImage(image: widget.image),
                        CustomAppBarItem(
                          title: widget.title,
                          price: widget.price,
                          imagUrl: widget.image,
                          des: widget.des,
                        ),
                        CustomContinerWithProductInfo(
                            title: widget.title, s: s, m: m)
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 30),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomProductDeiscription(
                              des: widget.des,
                            ),
                            // const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CustomProductSizeText(),
                                Row(
                                  //  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        prodctNumber++;
                                        setState(() {});
                                      },
                                      child: const SizedBox(
                                        height: 32,
                                        width: 20,
                                        child: Text('+',
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(prodctNumber.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 30,
                                        )),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (prodctNumber > 0) {
                                          prodctNumber--;
                                        }
                                        setState(() {});
                                      },
                                      child: const Text('-',
                                          style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(
                                      width: 55,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            // const SizedBox(height: 1),
                            const CustomProductSizeBottons(),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomproductPriceColumn(
                              price: widget.price, s: s, m: m),
                          CustomBottom(
                            title: 'Buy Now',
                            ontap: () {
                              if (shopcard == false) {
                                shopcard = true;

                                setState(() {});
                              } else {
                                shopcard = false;
                                setState(() {});
                              }
                              if (shopcard == true) {
                                addProductToShoppingProductsCard();

                                setState(() {});
                              } else if (shopcard == false) {
                                removeProductFromShoppingProductsCard();
                                setState(() {});
                              }
                            },
                          )
                        ],
                      ))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void addProductToShoppingProductsCard() {
    int x = 0;
    for (var i = 0; i < shoppingProductList.length; i++) {
      if (shoppingProductList[i].imagUrl == widget.image) {
        x++;
        setState(() {});
      }
    }
    if (x == 0) {
      shoppingProductList.add(ProductModel(
          title: widget.title,
          descrip: widget.des,
          imagUrl: widget.image,
          price: widget.price,
          numberOfPaces: prodctNumber));
      setState(() {});
    }
  }

  void removeProductFromShoppingProductsCard() {
    for (var i = 0; i < shoppingProductList.length; i++) {
      if (shoppingProductList[i].imagUrl == widget.image) {
        shoppingProductList.removeAt(i);
        setState(() {});
      }
    }
  }
}
