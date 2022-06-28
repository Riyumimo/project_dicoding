import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/bloc/cart/cart_bloc.dart';
import 'package:project_dicoding/config/routes.dart';
import 'package:project_dicoding/page/my_homepage.dart';
import 'package:project_dicoding/screen/cart_screen.dart';
import 'package:project_dicoding/screen/home_screen.dart';
import 'package:project_dicoding/screen/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()..add(LoadCart()),
        ),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoute.onGeneratorRoute,
        initialRoute: HomeScreen.routeName,
        debugShowCheckedModeBanner: false,
        home:WishListScreen(),
      ),
    );
  }
}
