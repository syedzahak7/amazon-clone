import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widget/transperentproduct.dart';
import '../provider/productprovider.dart';

class ViewAllScreen extends StatelessWidget {
   ViewAllScreen({super.key, required this.appbar});
final String appbar;
int length=0;
  @override
  Widget build(BuildContext context) {

    final provider=Provider.of<ProductProvider>(context);
     length=appbar=='Popular Products'?provider.popularProducts.length:provider.trendingProducts.length;
   final prview=appbar=='Popular Products'?provider.popularProducts:provider.trendingProducts;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:Text( appbar),
        actions: [
          IconButton(
            icon: Image.asset('images/search@2x.png', scale: 2.0),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        itemCount:length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, i) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: TransparentImageCard(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.35,
            imageurl: prview[i].imageUrl,
            // tags: '[ _tag('Product', () {}), ]',
            title: prview[i].name,
            description: Text(prview[i].description!, style: const TextStyle(color: Colors.white)),
          ),
        ),
      )
    );
  }
}
