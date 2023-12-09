import 'package:bookly/Features/details/presentation/details_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemSpecial extends StatelessWidget {
  String text;
  String subtext;

  String url;
  String price;

  ItemSpecial(
      {super.key,
      required this.text,
      required this.subtext,
      required this.url,
      required this.price});

  @override
  Widget build(BuildContext context) {
    // var text ;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 5, left: 2, right: 2),
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, 'detailspage');
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return DetailsView(
              title: text,
              des: subtext,
              image: url,
              price: price,
            );
          })));
        },
        child: Card(
          color: Colors.white.withOpacity(.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: double.infinity,
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(url), fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      // width: 170,
                      width: MediaQuery.of(context).size.width * .45,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        subtext,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      //  mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(width: 140),
                        const Text("\$ ",
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(price,
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
          ),
        ),
      ),
    );
  }
}
