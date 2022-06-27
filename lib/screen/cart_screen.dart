import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/models/product_models.dart';

import '../bloc/cart/cart_bloc.dart';
import '../widgets/cart_product.dart';
import '../widgets/summary_order.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final ProductModel productModel;
    var heightscreen = MediaQuery.of(context).size.height;
    var widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Order Details",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "My Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: widthscreen,
                      height: heightscreen * 0.45,
                      child: ListView.builder(
                        itemCount: state.cart.producsQuantity(state.cart.products).keys.length,
                        itemBuilder: (BuildContext context,  index) {
                          return CartProduct(
                            productModel: state.cart.producsQuantity(state.cart.products).keys.elementAt(index),
                            quantity: state.cart.producsQuantity(state.cart.products).values.elementAt(index),
                              widthscreen: widthscreen,
                              heightscreen: heightscreen);
                        },
                      ),
                    ),
                    // Spacer(),
                    const Divider(
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SummaryOrder(widthscreen: widthscreen)
                  ],
                ),
              );
            }
            return Text("Something is Wrong");
          },
        ));
  }
}



