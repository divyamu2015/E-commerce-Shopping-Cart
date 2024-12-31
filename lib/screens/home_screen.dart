import 'package:e_commerece_product_listing_app/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart/product_cart_bloc_bloc.dart';
import '../bloc/cart/product_cart_bloc_event.dart';
import '../services/product_services.dart';
import 'product_details.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Products>> products;

  @override
  void initState() {
    super.initState();
    products = ProductServices().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: {$snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Product list is Empty'),
            );
          }
          var productList = snapshot.data!;

          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              var product = productList[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    product.image,
                    width: 50,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.price.toString()),
                  trailing: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(AddCart(product));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${product.title} added to cart')),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ProductDetailScreen(
                          product: product,
                        );
                      },
                    ));
                  },
                ),
              );
            },
          );
        },
      ),
    ));
  }
}
