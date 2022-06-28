
import 'package:equatable/equatable.dart';
import 'package:project_dicoding/models/product_models.dart';

class WishList extends Equatable {

  final List<ProductModel> producst;

  const WishList({this.producst = const <ProductModel>[]});

  @override
  // TODO: implement props
  List<Object?> get props =>[producst];

  
}