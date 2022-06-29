import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/bloc/cart/cart_bloc.dart';
import 'package:project_dicoding/models/product_models.dart';

import '../bloc/wish/wish_bloc.dart';

class ProductScreen extends StatelessWidget {
  ProductModel productModel;
  ProductScreen({Key? key, required this.productModel}) : super(key: key);
  static const String routeName = '/product';
  static Route route({required ProductModel productModel}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ProductScreen(
        productModel: productModel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var widthtScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar,
        body: Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthtScreen * 0.3,
              height: heightScreen * 0.5,
              child: SafeArea(
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          category_widget(
                              icon: Icons.animation_outlined,
                              text: productModel.color),
                          category_widget(
                              icon: Icons.chair_alt_outlined,
                              text: productModel.category),
                          category_widget(
                              icon: Icons.gamepad_outlined,
                              text: productModel.weight),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: widthtScreen * 0.7,
              height: heightScreen * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productModel.imageUrl),
                      fit: BoxFit.cover),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20))),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          productModel.name,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        Text("Best for Interrios",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey)),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: double.infinity,
                width: widthtScreen * 0.75,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "\$${productModel.price}",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rating : ${productModel.rating}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Description",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                productModel.description,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: false,

                                maxLines: 6,
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(12),
                  child: BlocBuilder<WishBloc, WishState>(
                    builder: (context, state) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<WishBloc>()
                              .add(AddtWishList(productModel));
                        },
                        child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Icon(Icons.favorite)),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Container(
          height: heightScreen * 0.08,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.25),
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "MORE DETAILS",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30))),
                        // child: Text("ADD TO CHART"),
                      ),
                      Center(
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return TextButton(
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdd(productModel));
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ADD TO CHART",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ));
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class category_widget extends StatelessWidget {
  const category_widget({
    Key? key,
    required this.icon,
    this.text = '',
    this.height = 62,
    this.width = 62,
  }) : super(key: key);

  final IconData icon;
  final String? text;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              Icon(
                icon,
                size: height! / 2.toDouble(),
                color: Colors.black54,
              ),
              Text(text!)
            ],
          ),
        ),
      ),
    );
  }
}
