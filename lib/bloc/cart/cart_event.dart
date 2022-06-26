part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}
class LoadCart extends CartEvent{
     @override
  List<Object> get props => [];
}

class CartProductAdd extends CartEvent {
  final ProductModel productModel;

  const CartProductAdd(this.productModel);

    @override
  List<Object> get props => [productModel];
}

class CartProductRemove extends CartEvent {
  final ProductModel productModel;

  const CartProductRemove(this.productModel);

    @override
  List<Object> get props => [productModel];
}


