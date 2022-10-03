import 'dart:typed_data';

import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> items = [
      Product(
          id: '1',
          name: 'Item 1',
          price: 10000,
          image: 'assets/img/shoes1.jpg'),
      Product(
          id: '2',
          name: 'Item 2',
          price: 15000,
          image: 'assets/img/shoes2.jpg'),
      Product(
          id: '3',
          name: 'Item 3',
          price: 20000,
          image: 'assets/img/shoes3.jpg'),
      Product(
          id: '4',
          name: 'Item 4',
          price: 25000,
          image: 'assets/img/shoes1.jpg'),
      Product(
          id: '5',
          name: 'Item 5',
          price: 30000,
          image: 'assets/img/shoes2.jpg'),
      Product(
          id: '6',
          name: 'Item 6',
          price: 10000,
          image: 'assets/img/shoes3.jpg'),
      Product(
          id: '7',
          name: 'Item 7',
          price: 15000,
          image: 'assets/img/shoes1.jpg'),
      Product(
          id: '8',
          name: 'Item 8',
          price: 20000,
          image: 'assets/img/shoes2.jpg'),
      Product(
          id: '9', name: 'Item 9', price: 25000, image: 'assets/img/shoes3jpg'),
      Product(
          id: '10',
          name: 'Item 10',
          price: 30000,
          image: 'assets/img/shoes1.jpg'),
      // 'Item 1',
      // 'Item 2',
      // 'Item 3',
      // 'Item 4',
      // 'Item 5',
      // 'Item 6',
      // 'Item 7',
      // 'Item 8',
      // 'Item 9',
      // 'Item 10',
    ];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'back',
            onPressed: () {},
          ),
          title: const Text('Shopping Cart'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(items[index].name),
                      leading: Image.asset(
                        items[index].image,
                        height: 56.0,
                        width: 56.0,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(
                        'Rp${items[index].price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    const ShoppingCartItemQTY(),
                  ],
                ),
                // color: Colors.teal.shade200,
                // padding: const EdgeInsets.all(40.0),
                // child: const Text('Item 1'),
              );
            })
        // ListView(
        //   children: [
        //     Container(
        //       color: Colors.teal.shade200,
        //       padding: const EdgeInsets.all(40.0),
        //       child: const Text('Item 1'),
        //     ),
        //     Container(
        //       color: Colors.teal.shade200,
        //       padding: const EdgeInsets.all(40.0),
        //       child: const Text('Item 2'),
        //     ),
        //     Container(
        //       color: Colors.teal.shade200,
        //       padding: const EdgeInsets.all(40.0),
        //       child: const Text('Item 3'),
        //     ),
        //   ],
        // ),
        );
  }
}

class ShoppingCartItemQTY extends StatefulWidget {
  const ShoppingCartItemQTY({Key? key}) : super(key: key);

  @override
  State<ShoppingCartItemQTY> createState() => _ShoppingCartItemQTYState();
}

class _ShoppingCartItemQTYState extends State<ShoppingCartItemQTY> {
  int _qty = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
        ),
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_qty > 1) _qty--;
            });
          },
        ),
        Text('$_qty'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _qty++;
          },
        ),
      ],
    );
  }
}
