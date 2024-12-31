//part of 'product_cart_bloc_bloc.dart';

import 'package:e_commerece_product_listing_app/model/products.dart';

sealed class CartBlocEvent {}

class AddCart extends CartBlocEvent {
  final Products products;
  AddCart(this.products);
}
