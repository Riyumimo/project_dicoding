import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dicoding/bloc/cart/cart_bloc.dart';

import '../models/product_models.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    Key? key,
    required this.widthscreen,
    required this.heightscreen,
    required this.productModel,
    required this.quantity,
  }) : super(key: key);

  final double widthscreen;
  final double heightscreen;
  final ProductModel productModel;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 12,
      ),
      width: widthscreen,
      height: heightscreen * 0.18,
      //  color: Colors.amber,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: widthscreen * 0.30,
                // color: Colors.red,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          productModel.imageUrl,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: SizedBox(
              // width: widthscreen*0.80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        productModel.name,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$${productModel.price.toString()}.00(-\$4.00 tax)",
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                    ],
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                context.read<CartBloc>().add(CartProductRemove(productModel));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey)),
                                  child: const Icon(Icons.remove)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           Text("$quantity"),
                          const SizedBox(
                            width: 10,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                context.read<CartBloc>().add(CartProductAdd(productModel));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey)),
                                  child: const Icon(Icons.add)),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
