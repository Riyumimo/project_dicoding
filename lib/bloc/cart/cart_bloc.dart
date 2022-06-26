import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_dicoding/models/cart_models.dart';
import 'package:project_dicoding/models/product_models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<CartProductAdd>(_onAddProduct);
    on<CartProductRemove>(_onRemoveProduct);
  }

  FutureOr<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 5));
      emit(CartLoaded());
    } catch (e) {
      emit(CartError());
    }
  }

  FutureOr<void> _onAddProduct(CartProductAdd event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.productModel),
            ),
          ),
        );
      } catch (e) {
        emit(CartError());
      }
    }
  }

  FutureOr<void> _onRemoveProduct(CartProductRemove event, Emitter<CartState> emit) {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        
         emit(
          CartLoaded(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.productModel),
            ),
          ),
        );
      } catch (e) {
        emit(CartError());
      }
      
    }
  }
}
