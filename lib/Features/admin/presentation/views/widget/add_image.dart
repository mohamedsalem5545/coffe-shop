import 'package:flutter/material.dart';

class CircularAvaterView extends StatefulWidget {
  const CircularAvaterView({super.key, this.ontap, this.imageUrl});
  final void Function()? ontap;
  final String? imageUrl;
  @override
  State<CircularAvaterView> get createState => _CircularAvaterViewState();
}

class _CircularAvaterViewState extends State<CircularAvaterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 150.0,
          height: 150.0,
          color: Colors.orangeAccent,
=======
   

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 62,
>>>>>>> 8482340e6fa6ffa64e579103ce52959e6bdaae33
          child: widget.imageUrl != null
              ? Container(
                  width: 145.0,
                  height: 145.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget
                          .imageUrl!), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  width: 145.0,
                  height: 145.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/s3.jpg'), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color(0xfff5f6f9),
          child: Center(
              child: IconButton(
            onPressed: widget.ontap,
          
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.black.withOpacity(0.3),
            ),
          )),
        )
      ],
    );
  }
<<<<<<< HEAD
=======

  
>>>>>>> 8482340e6fa6ffa64e579103ce52959e6bdaae33
}
