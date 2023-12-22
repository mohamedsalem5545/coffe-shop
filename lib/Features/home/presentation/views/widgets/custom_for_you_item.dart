import 'package:bookly/Features/details/presentation/details_view.dart';
import 'package:flutter/material.dart';

class CustomForYouItem extends StatelessWidget {
  const CustomForYouItem({
    super.key,
    required this.title,
    required this.des,
    required this.image,
    required this.price,
  });

  final String title;
  final String des;
  final String image;
  final String price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('detailspage', (route) => false);
        // Navigator.pushNamed(context, 'detailspage');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailsView(
            title: title,
            des: des,
            image: image,
            price: price,
          );
        }));
      },
      child: Card(
        elevation: 20,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.only(right: 20),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff2e2b2e),
              borderRadius: BorderRadius.circular(25)),
          padding: const EdgeInsets.all(15),
          width: 170,
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
                        image: AssetImage(image),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                height: 5,
              ),
              Text(title,
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
                    Text(price,
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
  }
}
