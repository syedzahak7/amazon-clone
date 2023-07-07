import 'package:amazon_clone/modules/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{

  final List <Product> _popularProducts=[
    Product(imageUrl: 'images/iphone14.jpg', name: 'Iphone 14 Pro max', price: 44,description: ' new Apple phone'),
    Product(imageUrl:'images/iphone14cover.jpg', name: 'Iphone 14 Pro max Cover', price: 44,description: 'cover for Iphone 14'),
    Product(imageUrl: 'images/watch1.jpg', name: 'Watch', price: 44,description: 'beautiful wrist watch'),
    Product(imageUrl: 'images/iphone14.jpg', name: 'Iphone 14 Pro max', price: 44,description: ' new Apple phone'),
  ];
  List<Product> get popularProducts {
    return [..._popularProducts];
}
  final List <Product> _trendingProducts=[
    Product(imageUrl: 'images/macbook.jpg', name:  'MacBook Pro 2022', price: 44,description: ''),
    Product(imageUrl:'images/macbook1.jpg', name:  'MacBook Pro', price: 44,description: ''),
    Product(imageUrl:  'images/macbook2.jpg', name:  'MacBook Pro 2022', price: 44,description: ''),
    Product(imageUrl:'images/macbook.jpg', name:  'MacBook Pro 2022', price: 44,description: ''),
  ];
  List<Product> get trendingProducts {
    return [..._trendingProducts];
  }
  final List <Product> _specialOfferProducts=[
    Product(imageUrl: 'images/sofa.png', name:  '25\%', price: 44),
    Product(imageUrl:'images/wooden_chairs.png', name:  '25\%', price: 44),
    Product(imageUrl: 'images/lamp.png', name:  '25\%', price: 44),
    Product(imageUrl:'images/sofa.png', name:  '25\%', price: 44),
  ];
  List<Product> get specialOfferProducts {
    return [..._specialOfferProducts];
  }
  final List <Product> _favproducts=[


  ];
  void addtofav(String imageUrl,String name,double price){
    bool i=true;
    if(!_favproducts.any((element) => element.imageUrl==imageUrl)){
      _favproducts.add(
                 Product(imageUrl: imageUrl, name: name, price: price)
             );
    }
    else{
      _favproducts.removeWhere((element) => element.imageUrl==imageUrl);
    }

  print(_favproducts);

  }
  void deleteProduct(String name){
    _favproducts.removeWhere((element) => element.name==name);
  }
  List<Product> get favProducts{
    return [..._favproducts];
  }
}