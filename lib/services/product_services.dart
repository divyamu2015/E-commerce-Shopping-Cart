import 'dart:convert';

import 'package:e_commerece_product_listing_app/model/products.dart';
import 'package:e_commerece_product_listing_app/secrete_codes/url.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future<List<Products>> getProducts() async {
    final response = await http.get(Uri.parse(SecreteCode().apuri));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Loding products will be Failed');
    }
  }
}
