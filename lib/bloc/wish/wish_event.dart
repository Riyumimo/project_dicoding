part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable {
  const WishEvent();

  @override
  List<Object> get props => [];
}

class StartWishList extends WishEvent {}
class AddtWishList extends WishEvent {
  final ProductModel productModel;
  const AddtWishList(this.productModel);
   @override
  List<Object> get props => [productModel];

}
class RemoveWishList extends WishEvent {
    final ProductModel productModel;
  const RemoveWishList(this.productModel);
   @override
  List<Object> get props => [productModel];
}