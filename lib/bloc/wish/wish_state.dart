part of 'wish_bloc.dart';

abstract class WishState extends Equatable {
  const WishState();
  
  @override
  List<Object> get props => [];
}

class WishLoading extends WishState {}
class WishLoaded extends WishState {
  final WishList wishList;

  const WishLoaded({this.wishList =const WishList()});

  @override
  List<Object> get props => [wishList];
}
class WishError extends WishState {}
