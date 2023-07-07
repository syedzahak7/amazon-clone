import 'package:amazon_clone/Screens/detail_screen.dart';
import 'package:flutter/material.dart';
import '../provider/productprovider.dart';
import 'package:provider/provider.dart';
class ProductWidget extends StatefulWidget{
   const ProductWidget({super.key,required this.imageUrl,required this.productName,required this.price});
final String imageUrl;
 final String productName;
 final double price;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
   bool _isfavorite=false;

  @override
  Widget build(BuildContext context) {
   final provider=Provider.of<ProductProvider>(context);

    return  Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
          width: MediaQuery.of(context).size.width*.45,
         height: MediaQuery.of(context).size.height*.25,
            color: const Color.fromARGB(255, 35, 47, 62),

          child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Expanded(
            child: GestureDetector(
              onTap:(){
     // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(imageUrls: [widget.imageUrl,], name: widget.productName,price: widget.price,)));
              Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopDetailScreen(name: widget.productName, price: widget.price, imageUrls: [widget.imageUrl],)));
              } ,
              child: Image.asset(widget.imageUrl,fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(widget.productName,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
          ),
          const SizedBox(height: 5,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child:   Column(
  children: [
  Text('\$ ${widget.price}',style: const TextStyle(color: Colors.white)),
  Text('\$ ${widget.price}',style: const TextStyle(color: Colors.white,decoration: TextDecoration.lineThrough)),
  ],
  ),
),
const Text('drop',style: TextStyle(color: Colors.white))
],
),
            const SizedBox(height: 10,),
const Divider(
  height: 0,
  thickness: 1.5,
  color: Colors.black,
),
            TextButton(onPressed: (){}, child: const Text('Add to Cart',style: TextStyle(color: Colors.white),))
],
),
),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(onPressed:(){


                if(!_isfavorite) {
                  provider.addtofav(widget.imageUrl, widget.productName, widget.price);
                } else{
                  provider.deleteProduct(widget.productName);
                }
                setState(() {
                  _isfavorite =provider.favProducts.any((element) => element.name==widget.productName);

                });

                }, icon: Icon(_isfavorite?Icons.favorite:Icons.favorite_border,color: Colors.white,))),
          )
        ],
      ),
    );
  }
}
