import 'package:flutter/material.dart';
import 'package:project_dicoding/models/product_models.dart';
import 'package:project_dicoding/screen/home_screen.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WishListScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WishListScreen"),
      ),
      body: ListView.builder(
        itemCount: ProductModel.producst.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: cardProduct(productModel: ProductModel.producst[index],widthScreen: double.infinity,),
          );
        },
      ),
    );
  }
}
