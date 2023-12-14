import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter/material.dart';

class CustomAppBarItem extends StatefulWidget {
  const CustomAppBarItem({
    super.key,
    required this.title,
    required this.des,
    required this.price,
    required this.imagUrl,
  });
  final String title;
  final String des;
  final String price;
  final String imagUrl;
  @override
  State<CustomAppBarItem> createState() => _CustomAppBarItemState();
}

class _CustomAppBarItemState extends State<CustomAppBarItem> {
  bool lov = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Icon(
              //   Icons.arrow_back_ios_outlined,
              //   color: Colors.white.withOpacity(.5),
              // ),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //  Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_outlined)),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  if (lov == false) {
                    lov = true;
                    AddFavoriteProductCubit().addProductToList(
                        'Ahmed@gamil.com',
                        ProductModel(
                            title: widget.title,
                            descrip: widget.des,
                            imagUrl: widget.imagUrl,
                            price: widget.price));
                    setState(() {});
                  } else {
                    setState(() {});
                  }
                },
                icon: Icon(
                  lov == true ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
