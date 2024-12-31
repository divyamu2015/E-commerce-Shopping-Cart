// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../model/products.dart';

import 'product_cart_bloc_event.dart';
import 'product_cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocState([]));

  @override
  Stream<CartBlocState> mapEventToState(CartBlocEvent event) async* {
    if (event is AddCart) {
      final updatedCart = List<Products>.from(state.cartitems)
        ..add(event.products);
      yield CartBlocState(updatedCart);
    }
  }
}
