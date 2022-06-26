import 'package:equatable/equatable.dart';
import 'package:project_dicoding/models/product_models.dart';

class Cart extends Equatable {
  final List<ProductModel> products;

 const Cart({this.products=const <ProductModel>[]});



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
}