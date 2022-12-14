import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/ui/product_detail/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/cart.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
          id: '1',
          name: 'Item 1',
          description: 'this is a shoe',
          price: 10000,
          image: 'assets/img/shoes1.jpg'),
      Product(
          id: '2',
          name: 'Item 2',
          description: 'this is another shoe',
          price: 15000,
          image: 'assets/img/shoes2.jpg'),
      Product(
          id: '3',
          name: 'Item 3',
          description: 'this is also a shoe',
          price: 20000,
          image: 'assets/img/shoes3.jpg'),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed: () {},
        ),
        title: const Text('Catalog'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Shopping Cart',
          )
        ],
      ),
      body: FutureBuilder(
        future: getProductsFromFirebase(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An Error has occured: \n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          if (snapshot.hasData) {
            List<Product> products = snapshot.data!;
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return CatalogProductCard(product: products[index]);
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      //Changed because using firebase, not using offline data dummy
      // ListView.builder(
      //     itemCount: products.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return CatalogProductCard(product: products[index]);
      //     }),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  const CatalogProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product_detail', arguments: product);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return ProductDetailPage(product: product);
          //     },
          //   ),
          // );
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
            // Image.asset(
            //   product.image,
            //   fit: BoxFit.cover,
            // ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 10),
                  ),
                  Text(
                    'Rp${product.price}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 200),
                        child: TextButton.icon(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .addToCart(product);
                            Navigator.pushNamed(context, '/shopping_cart');
                          },
                          icon: const Icon(Icons.shopping_cart_outlined),
                          label: const Text('Add to Cart'),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.tealAccent.shade700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
