import 'package:flutter/material.dart';
import 'package:e_commerce/model/cart.dart';
import 'package:e_commerce/model/order.dart';
import 'package:provider/provider.dart';

class ProcessCheckoutPage extends StatelessWidget {
  ProcessCheckoutPage({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: sendOrderToFirebase(order),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('an error has occured: \n${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Order Placed!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Finish'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.tealAccent.shade700,
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, ((route) => route.isFirst));
                    Provider.of<Cart>(context).clearCart();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
