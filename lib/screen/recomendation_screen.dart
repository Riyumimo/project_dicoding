import 'package:flutter/material.dart';
import 'package:project_dicoding/models/product_models.dart';
import 'package:project_dicoding/widgets/product_card.dart';

class RecomendationScreen extends StatelessWidget {
  const RecomendationScreen ({Key? key}) : super(key: key);
  static const String routeName = '/recomendation';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const RecomendationScreen (),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text(
          "Recomendation",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ProductModel.producst
            .where((element) => element.isPopular)
            .length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: cardProduct(
              productModel: ProductModel.producst
                  .where((element) => element.isPopular)
                  .toList()[index],
              widthScreen: double.infinity,
            ),
          );
        },
      ),
    );
  }
}
