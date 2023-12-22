import 'package:bookly/Features/details/presentation/details_view.dart';
import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FavoriteItemSpecial extends StatelessWidget {
  String text;
  String subtext;

  String url;
  String price;

  FavoriteItemSpecial(
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
      child: Card(
        color: Colors.white.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: 120,
          //  width: double.infinity,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return DetailsView(
                  title: text,
                  des: subtext,
                  image: url,
                  price: price,
                );
              })));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: double.infinity,
                    //width: 100,
                    width: MediaQuery.of(context).size.width * .25,
                    decoration: BoxDecoration(
                        image: url[0] == 'h'
                            ? DecorationImage(
                                image: NetworkImage(url), fit: BoxFit.cover)
                            : DecorationImage(
                                image: AssetImage(url), fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
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
                      width: MediaQuery.of(context).size.width * .4,
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                        ),
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<GetFavoriteProductCubit>(context)
                        .deleteProductById(text);
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.05,
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
