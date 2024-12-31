import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/product_cart_bloc_bloc.dart';
import '../bloc/cart/product_cart_bloc_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartBlocState>(
        builder: (context, state) {
          if (state.cartitems.isEmpty) {
            return const Center(child: Text('No items in the cart.'));
          }
          double totalPrice =
              state.cartitems.fold(0, (sum, item) => sum + item.price);

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartitems.length,
                  itemBuilder: (context, index) {
                    var item = state.cartitems[index];
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Checkout successful!')),
                    );
                  },
                  child: const Text('Checkout'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
