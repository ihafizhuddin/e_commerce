import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/model/order.dart';
import 'package:e_commerce/ui/checkout/index.dart';
import 'package:e_commerce/ui/checkout/proccess_checkout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/ui/catalog/index.dart';
import 'package:e_commerce/ui/product_detail/index.dart';
import 'model/cart.dart';
import 'ui/shopping_cart/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Jalankan MyApp
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: const MyApp(),
  ));
}

//Widget utama
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          '/checkout': (context) => const CheckoutPage(),
          '/process_checkout': (context) => ProcessCheckoutPage(
              order: ModalRoute.of(context)?.settings.arguments as Order),
        });
  }
}
