import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dicoding/models/product_models.dart';
import 'package:project_dicoding/models/wishlist_models.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc() : super(WishLoading()) {
    on<StartWishList>(_mapStartWishListToState);
    on<AddtWishList>(_mapAddWishListProductToState);
    on<RemoveWishList>(_mapRemoveWishListProductToState);
  }

  FutureOr<void> _mapStartWishListToState(
      StartWishList event, Emitter<WishState> emit) async {
    emit(WishLoading());
    try {
      await Future<void>.delayed(Duration(seconds: 4));
      emit(const WishLoaded());
    } catch (e) {}
  }

  FutureOr<void> _mapAddWishListProductToState(
      AddtWishList event, Emitter<WishState> emit) {
    final state = this.state;
    if (state is WishLoaded) {
      emit(WishLoaded(
        wishList: WishList(
          producst: List.from(state.wishList.producst)..add(event.productModel),
        ),
      ));
    }
  }

  FutureOr<void> _mapRemoveWishListProductToState(
      RemoveWishList event, Emitter<WishState> emit) {
    final state = this.state;
    if (state is WishLoaded) {
      try {
        emit(
          WishLoaded(
              wishList: WishList(
            producst: List.from(state.wishList.producst)
              ..remove(event.productModel),
          )),
        );
      } catch (e) {}
    }
  }
}
