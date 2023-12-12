// ignore_for_file: avoid_print

import 'package:bookly/Features/admin/presentation/admi_view.dart';
import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/add_to_shopping_card_cubit/add_to_shopping_card_cubit.dart';
import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_cubit.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/login/presentatiion/login_view.dart';
import 'package:bookly/Features/other_page/cappuccine_view.dart';
import 'package:bookly/Features/other_page/coffe_view.dart';
import 'package:bookly/Features/other_page/latte_view.dart';
import 'package:bookly/Features/other_page/other_view.dart';
import 'package:bookly/Features/other_page/tea_view.dart';
import 'package:bookly/Features/person/presentation/person_view.dart';
import 'package:bookly/Features/signup/presentation/signup_view.dart';
import 'package:bookly/Features/splesh/presentation/splesh_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  print('2030');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FavoriteProductCubit().addProductToList(
  //     'Ahmed@gamil.com',
  //     ProductModel(
  //         title: 'milk',
  //         descrip: 'is the best milk',
  //         imagUrl: 'image.milk',
  //         price: '4'));
  // var x =
  //     await FavoriteProductCubit().getFavoriteProductData('Ahmed@gamil.com');
  // print("x is ${x.length}");
  runApp(const MyApp());
}

// this is the soft ware project
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavoriteProductCubit(),
        ),
        BlocProvider(
          create: (context) => AddShoppingCardProductsCubit(),
        ),  BlocProvider(
          create: (context) => GetShoppingCardProducts(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            //ladfadslfasf
            // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
            brightness: Brightness.dark,
            appBarTheme: const AppBarTheme(
                // backgroundColor: Colors.gre,
                titleTextStyle: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        routes: {
          //total
          'signup': (context) => const SingnUpView(),
          'login': (context) => const LoginView(),
          'homepage': (context) => const HomeView(),
          //'favorite': (context) => const FavoriteView(),
          'coffepage': (context) => const CoffeView(),
          'cappuccinepage': (context) => const CappuccineView(),
          'teapage': (context) => const TeaView(),
          'lattepage': (context) => const LatteView(),
          'otherpage': (context) => const OtherView(),
          //'detailspage': (context) =>  DetailsView(),
          'Splashpage': (context) => const SplashView(),
          'Personpage': (context) => const PersonBody(),
          'admin': (context) => MyAppa(),
        },
      ),
    );
  }
}
