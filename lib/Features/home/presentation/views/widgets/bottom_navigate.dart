import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/login/presentatiion/login_view.dart';
import 'package:bookly/Features/signup/presentation/signup_view.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currntIndex = 0;
  // List<Widget> childern = [
  //   const HomePage(),
  //   const Search(),
  //   // HomePage(),
  //   // Search(),
  // ];
  void onTapperBar(int index) {
    setState(() {
      _currntIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //childern[_currntIndex];

    return BottomNavigationBar(

        // showSelectedLabels: false,

        onTap: onTapperBar,
        currentIndex: _currntIndex,
        // showUnselectedLabels: false,
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
              // color:
              //     index == 0 ? Colors.orange : Colors.grey.withOpacity(.6),
            ),
          ),
          BottomNavigationBarItem(
              label: "search",
              icon: Icon(
                Icons.shopify,
                // color:
                //     index == 1 ? Colors.orange : Colors.grey.withOpacity(.6),
              )),
          BottomNavigationBarItem(
              label: "Favourite",
              icon: Icon(
                Icons.favorite,
                // color:
                //     index == 2 ? Colors.orange : Colors.grey.withOpacity(.6),
              )),
          BottomNavigationBarItem(
              label: "Favourite",
              icon: Icon(
                Icons.notification_add,
                // color:
                //     index == 3 ? Colors.orange : Colors.grey.withOpacity(.6),
              )),
        ]);
  }
}

Widget getScreen(int index) {
  switch (index) {
    case 0:
      return const HomeView();
    case 1:
      return const SingnUpView();
    case 2:
      return const HomeView();
    default:
      return const LoginView();
  }
}
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class bottomAppBar extends StatelessWidget {
//   const bottomAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Container(
//         color: Colors.black,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const homeView(),
//                     //   ),
//                     // );
//                   },
//                   icon: const Icon(FontAwesomeIcons.commentDollar),
//                 ),
//                 //  Icon(FontAwesomeIcons.commentDollar),
//                 const Text('Chats'),
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const callsView(),
//                     //   ),
//                     // );
//                   },
//                   icon: const Icon(FontAwesomeIcons.video),
//                 ),
//                 const Text('Calls'),
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const peopleView(),
//                     //   ),
//                     // );
//                   },
//                   icon: const Icon(Icons.people),
//                 ),
//                 const Text('People'),
//               ],
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => const Stories(),
//                     //   ),
//                     // );
//                   },
//                   icon: const Icon(FontAwesomeIcons.rectangleList),
//                 ),
//                 const Text('Stories'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
