import 'package:flutter/material.dart';
import 'package:project_dicoding/models/product_models.dart';

import '../screen/cart_screen.dart';
import '../screen/catalog_screen.dart';
import '../screen/checkout_screen.dart';
import '../screen/home_screen.dart';
import '../screen/product_screen.dart';
import '../screen/wishlist_screen.dart';

class AppRoute {
  static Route onGeneratorRoute(RouteSettings settings){
    switch(settings.name){
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case WishListScreen.routeName:
        return WishListScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route();        
      case ProductScreen.routeName:
        return ProductScreen.route(productModel: settings.arguments as ProductModel);  
      case CartScreen.routeName:
        return CartScreen.route();      
      default: return _errorRoute();
    }

  }

  
}

 Route _errorRoute() {
  return MaterialPageRoute(
    settings: RouteSettings(name: '/error'),
    builder: 
  (context) => Scaffold(
    appBar: AppBar(title: Text("error"),)
  ),);
}