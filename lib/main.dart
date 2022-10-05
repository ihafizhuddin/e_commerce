import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/ui/catalog/index.dart';
import 'package:e_commerce/ui/product_detail/index.dart';
import 'package:flutter/material.dart';
import 'ui/shopping_cart/index.dart';

void main() {
  //Jalankan StoreApp
  runApp(const StoreApp());
}

//Widget utama
class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'E-Commerce Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        // home: const CatalogPage(),
        routes: {
          '/': (context) => const CatalogPage(),
          '/shopping_cart': (context) => const ShoppingCartPage(),
          '/product_detail': (context) => ProductDetailPage(
              product: ModalRoute.of(context)?.settings.arguments as Product),
        });
  }
}
