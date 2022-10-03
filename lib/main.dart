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
      home: const ShoppingCartPage(),
    );
  }
}
