import 'package:flutter/material.dart';

class CustomProductSizeBottons extends StatefulWidget {
  const CustomProductSizeBottons({super.key});

  @override
  State<CustomProductSizeBottons> createState() =>
      _CustomProductSizeBottonsState();
}

class _CustomProductSizeBottonsState extends State<CustomProductSizeBottons> {
  var s = true;

  var m = false;

  var l = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              s = true;
              m = false;
              l = false;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                  color: s ? Colors.black : Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    right: customBorderSide(s),
                    left: customBorderSide(s),
                    top: customBorderSide(s),
                    bottom: customBorderSide(s),
                  )),
              child: Center(
                child: Text(
                  "S",
                  style: TextStyle(
                      color: s ? Colors.orange : Colors.white.withOpacity(.8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              s = false;
              m = true;
              l = false;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                  color: m ? Colors.black : Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    right: customBorderSide(m),
                    left: customBorderSide(m),
                    top: customBorderSide(m),
                    bottom: customBorderSide(m),
                  )),
              child: Center(
                child: Text(
                  "M",
                  style: TextStyle(
                      color: m ? Colors.orange : Colors.white.withOpacity(.8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              s = false;
              m = false;
              l = true;
              setState(() {});
            },
            child: Container(
              height: 40,
              width: 110,
              decoration: BoxDecoration(
                  color: l ? Colors.black : Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    right: customBorderSide(l),
                    left: customBorderSide(l),
                    top: customBorderSide(l),
                    bottom: customBorderSide(l),
                  )),
              child: Center(
                child: Text(
                  "L",
                  style: TextStyle(
                      color: l ? Colors.orange : Colors.white.withOpacity(.8),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BorderSide customBorderSide(bool s) {
  return BorderSide(color: s ? Colors.orange : Colors.black);
}
