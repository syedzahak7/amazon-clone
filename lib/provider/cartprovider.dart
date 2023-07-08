import 'package:flutter/cupertino.dart';
import '../modules/cart.dart';

class CartProvider with ChangeNotifier {
  final List <Cart> _cartList=[];
  List<Cart> get cartList {
    return [..._cartList];
  }
  void addCart(String imageurl,String name,double price,int quantity){
    _cartList.add(Cart(imageUrl: imageurl, name:name, price: price, quantity: quantity));
  }
}