import 'package:equatable/equatable.dart';
import 'package:project_dicoding/models/product_models.dart';

class Cart extends Equatable {
  final List<ProductModel> products;

 const Cart({this.products=const <ProductModel>[]});



  @override
  // TODO: implement props
  List<Object?> get props => [products];

  Map producsQuantity(producuts){
    var quantity = Map();

    products.forEach((product) {
      if(!quantity.containsKey(product)){
        quantity[product]=1;
      }else{
        quantity[product]+=1;
      }
    });
    return quantity;
  }

  double get subtotal=> products.fold(0, (total, current) => total+current.price);

  double deleveryfree(subtotal){
    if(subtotal>= 100){
      return 0.0;
    }
    else{
      return 4.00;
    }
    
  }

  String freeDelevery(subtotal){
    if(subtotal>= 100){
      return ' You Get Free Delevery';
    }else{
      double missing = 4 - this.subtotal;
      return 'Add \$${missing.toStringAsFixed(2)}';
    }
  }

  double total(subtotal,deleveryfee){
    return subtotal+deleveryfee(subtotal);
  }
  String get freeDeleveryString=>  freeDelevery(subtotal.toString());
  String get totalString=>  total(subtotal,deleveryfree).toString();
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deleveryFeeString => deleveryfree(subtotal).toString();


  
}