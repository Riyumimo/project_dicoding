import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wish/wish_bloc.dart';
import '../models/product_models.dart';

class cardProduct extends StatelessWidget {
  const cardProduct({
    Key? key,
    required this.productModel,
    this.widthScreen = 240,
    this.isWishList = false,
  }) : super(key: key);

  final ProductModel productModel;
  final double? widthScreen;
  final bool isWishList;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          elevation: 10,
          shadowColor: Colors.grey.withOpacity(0.1),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/product',
                arguments: productModel),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                // margin: EdgeInsets.only(right: 10),
                height: 100,
                width: widthScreen,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      width: 85,
                      height: 100,
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          productModel.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productModel.name,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(productModel.category,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14)),
                        Text(productModel.color,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 13)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.currency_bitcoin),
                            Text('\$${productModel.price}'),
                            SizedBox(width: 10),
                            Icon(Icons.star),
                            Text(productModel.rating),
                            // Flex(direction: Axis.vertical),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                    child: isWishList
                        ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Material(
                                borderRadius: BorderRadius.circular(12),
                                child: BlocBuilder<WishBloc, WishState>(
                                  builder: (context, state) {
                                    return InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          context.read<WishBloc>().add(RemoveWishList(productModel));
                                        },
                                        child: Container(
                                            child: Icon(
                                                size: 32,
                                                Icons.highlight_remove_rounded)));
                                  },
                                )),
                          )
                        : SizedBox()),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
