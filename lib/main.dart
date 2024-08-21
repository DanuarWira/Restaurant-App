import 'package:flutter/material.dart';
import 'package:restaurant_app/view/DetailScreen/detail_screen.dart';
import 'package:restaurant_app/view/HomeScreen/home_screen.dart';

import 'model/restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: homeScreen.routeName,
      routes: {
        homeScreen.routeName: (context) => const homeScreen(),
        detailScreen.routeName: (context) => detailScreen(
          restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
        )
      },
    );
  }
}