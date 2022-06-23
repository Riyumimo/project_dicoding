import 'package:flutter/material.dart';
import 'package:project_dicoding/config/routes.dart';
import 'package:project_dicoding/page/my_homepage.dart';
import 'package:project_dicoding/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      onGenerateRoute:  AppRoute.onGeneratorRoute,
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}