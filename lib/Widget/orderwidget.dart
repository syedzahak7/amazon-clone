import 'package:flutter/material.dart';
class OrderItemWidget extends StatelessWidget {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final int itemQuantity;

  const OrderItemWidget({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.itemQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            itemImage,
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Quantity: $itemQuantity',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Total: \$${(itemPrice * itemQuantity).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
