import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/models/product_models.dart';
import 'package:project_dicoding/screen/home_screen.dart';

import '../bloc/wish/wish_bloc.dart';
import '../widgets/product_card.dart';

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
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "WishList",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
      body: BlocBuilder<WishBloc, WishState>(
        builder: (context, state) {
          if (state is WishLoaded) {
            return ListView.builder(
              itemCount: state.wishList.producst.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: cardProduct(
                    productModel: state.wishList.producst[index],
                    widthScreen: double.infinity,
                    isWishList: true,
                  ),
                );
              },
            );
          }
          return Center(child: Text("data"));
        },
      ),
    );
  }
}
