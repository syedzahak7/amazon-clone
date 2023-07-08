import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/orderwidget.dart';
import '../provider/orderprovider.dart';

class OrderScreen extends StatelessWidget {
  static const routname='/order';
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Order Summary'),
      ),
      body: ListView.builder(
        itemCount: provider.orderList.length, // Replace with the actual number of ordered items
        itemBuilder: (context, index) {
          return const OrderItemWidget(
            // Pass the necessary data for each ordered item
            itemName: 'Product Name',
            itemPrice: 9.99,
            itemImage: 'images/sofa.png',
            itemQuantity: 2,
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle payment logic
          },
          child: Text('Make Payment'),
        ),
      ),
    );
  }
}
