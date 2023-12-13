import 'package:flutter/material.dart';

class CircularAvaterView extends StatefulWidget {
  const CircularAvaterView({super.key, this.ontap, this.imageUrl});
  final void Function()? ontap;
  final String? imageUrl;
  @override
  State<CircularAvaterView> createState() => _CircularAvaterViewState();
}

class _CircularAvaterViewState extends State<CircularAvaterView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 62,
          child: widget.imageUrl != null
              ? CircleAvatar(
                  radius: 60, backgroundImage: NetworkImage(widget.imageUrl!))
              : const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/s3.jpg'),
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

  
}
