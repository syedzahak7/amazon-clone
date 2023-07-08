import 'package:flutter/cupertino.dart';

import '../modules/cart.dart';
import '../modules/order.dart';

class OrderProvider with ChangeNotifier {
  List <Order> _orderList=[];
  List<Order> get orderList {
    return [..._orderList];
  }
  // // set setOrders(List<Cart> carts) {
  // //   _orderList = carts.cast<Order>();
  // // }
  // void set(List<Cart> carts) {
  // //  _orderList = carts.cast<Order>();
  // }

}