import 'package:amazon_clone/Widget/productWidget.dart';
import 'package:amazon_clone/provider/productprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/product.dart';
class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
   final provider= Provider.of<ProductProvider>(context);
   List<Product>listproducts=provider.favProducts;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      itemCount: listproducts.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context,i)=>
        ProductWidget(imageUrl: listproducts[i].imageUrl, productName: listproducts[i].name, price: listproducts[i].price,),);
  }
}
