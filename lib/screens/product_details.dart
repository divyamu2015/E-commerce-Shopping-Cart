import 'package:e_commerece_product_listing_app/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/product_cart_bloc_bloc.dart';
import '../bloc/cart/product_cart_bloc_event.dart';

class ProductDetailScreen extends StatelessWidget {
  final Products product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(product.title)),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.image, width: 200),
                const SizedBox(height: 10),
                Text(product.title,
                    style:
                        const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('\$${product.price}',
                    style: const TextStyle(fontSize: 20, color: Colors.green)),
                const SizedBox(height: 10),
                Text(product.description),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(AddCart(product));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${product.title} has been added to the cart!')),
                    );

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailScreen(
                          product: product,
                        );
                      },
                    ));
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            )));
  }
}
