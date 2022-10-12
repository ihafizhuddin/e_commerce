import 'dart:typed_data';

import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<Cart>(
          builder: (BuildContext context, Cart cart, Widget? child) {
        return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: cart.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(cart.items[index].product.name),
                      leading: Image.asset(
                        cart.items[index].product.image,
                        height: 56.0,
                        width: 56.0,
                        fit: BoxFit.cover,
                      ),
                      subtitle: Text(
                        'Rp${cart.items[index].product.price}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ),
                    ShoppingCartItemQty(index: index),
                  ],
                ),
                // color: Colors.teal.shade200,
                // padding: const EdgeInsets.all(40.0),
                // child: const Text('Item 1'),
              );
            });
      }),
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
      bottomNavigationBar: const ShoppingCartTotal(),
    );
  }
}

class ShoppingCartItemQty extends StatelessWidget {
  const ShoppingCartItemQty({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).removeFromCart(index);
          },
        ),
        SizedBox(
          width: 12,
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).decItemQty(index);
          },
        ),
        Selector<Cart, int>(
          selector: (BuildContext context, Cart cart) {
            return cart.items[index].qty;
          },
          builder: (BuildContext context, int qty, Widget? child) {
            return Text('$qty');
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Provider.of<Cart>(context, listen: false).incItemQty(index);
          },
        )
      ],
    );
  }
}
//Diganti menjadi sebuah stateless widget karena provider
// class ShoppingCartItemQTY extends StatefulWidget {
//   const ShoppingCartItemQTY({Key? key}) : super(key: key);

//   @override
//   State<ShoppingCartItemQTY> createState() => _ShoppingCartItemQTYState();
// }

// class _ShoppingCartItemQTYState extends State<ShoppingCartItemQTY> {
//   int _qty = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.delete),
//         ),
//         IconButton(
//           icon: Icon(Icons.remove),
//           onPressed: () {
//             setState(() {
//               if (_qty > 1) _qty--;
//             });
//           },
//         ),
//         Text('$_qty'),
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//             _qty++;
//           },
//         ),
//       ],
//     );
//   }
// }
class ShoppingCartTotal extends StatelessWidget {
  const ShoppingCartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.tealAccent.shade400),
        ),
      ),
      child: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListTile(
            title: const Text(
              'Total Price',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              'Rp${cart.totalPrice}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 150),
              child: TextButton(
                child: const Text('Checkout'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: cart.items.isNotEmpty
                      ? Colors.tealAccent.shade700
                      : Colors.grey.shade400,
                ),
                onPressed: cart.items.isNotEmpty ? () {} : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
