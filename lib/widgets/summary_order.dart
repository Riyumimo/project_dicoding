import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/cart_bloc.dart';

class SummaryOrder extends StatelessWidget {
  const SummaryOrder({
    Key? key,
    required this.widthscreen,
  }) : super(key: key);

  final double widthscreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
        return Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Order Info",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Subtotal",
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                    Text('\$${state.cart.subtotalString}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Shopping Cost",
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                    Text('\$${state.cart.deleveryFeeString}',
                        style: TextStyle(fontSize: 16, color: Colors.grey[500])),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                    Text('\$${state.cart.totalString}',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: widthscreen,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("CHECKOUT ('\$${state.cart.totalString}')")))
              ],
            ),
          ],
        );
   
        }
        return Text("data");
             },
    );
  }
}