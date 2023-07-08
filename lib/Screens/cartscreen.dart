import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/cartwidget.dart';
import '../provider/cartprovider.dart';
import '../provider/orderprovider.dart';

class CartScreen extends StatelessWidget {
  static const routname='/cart';
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<CartProvider>(context);
    final orderprovider=Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length, // Replace with the actual item count from the cart
        itemBuilder: (context, index) {
       provider.cartList[index].name;

          return CartItemWidget(
            // Pass the necessary data for each item
            itemName: provider.cartList[index].name,
            itemPrice: provider.cartList[index].price,
            itemImage: provider.cartList[index].imageUrl,
            itemQuantity: provider.cartList[index].quantity,
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {


            // Handle checkout logic
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}