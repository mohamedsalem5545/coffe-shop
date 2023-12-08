import 'package:bookly/Features/details/presentation/view/widgets/custom_product_icon_and_category_name.dart';
import 'package:flutter/material.dart';

class CustomContinerWithProductInfo extends StatelessWidget {
  final String title;
  const CustomContinerWithProductInfo({
    super.key,
    required this.s,
    required this.m,
    required this.title,
  });

  final bool s;
  final bool m;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.6),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.length >= 14
                            ? title.substring(0, title.length - 3)
                            : title,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('this is very good',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(.5),
                              decoration: TextDecoration.none)),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            s
                                ? '4.2'
                                : m
                                    ? '4.3'
                                    : '4.4',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            s
                                ? '(4.653)'
                                : m
                                    ? '(4.654)'
                                    : '(4.655)',
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      CustomProductIconAndCategoryname(
                        categoryName: 'Coffee',
                        icon: Icons.coffee,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomProductIconAndCategoryname(
                        categoryName: 'Milk',
                        icon: Icons.water_drop_rounded,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        s
                            ? "Small Roasted"
                            : m
                                ? "Medium Roasted"
                                : "Large Roasted",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
