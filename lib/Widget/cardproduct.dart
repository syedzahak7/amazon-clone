import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/detail_screen.dart';
import '../provider/productprovider.dart';
class ProductCardWidget extends StatefulWidget{
  const ProductCardWidget({super.key, required this.title, required this.price, required this.imageurl});
   final String title;
  final double price;
  final String imageurl;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool _isfavorite=false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [

        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ShopDetailScreen(name: widget.title, price: widget.price, imageUrls: [widget.imageurl])),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 35, 47, 62),
              borderRadius: BorderRadius.circular(30),
            ),
            height: MediaQuery.of(context).size.width * 0.38, // Changed to MediaQuery.of(context).size
            width: MediaQuery.of(context).size.width * 0.85, // Changed to MediaQuery.of(context).size
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 9),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Shop Now'),
                        ),
                      ],
                    ),
                  ),
                ),
                Image.asset(widget.imageurl),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                provider.addtofav(widget.imageurl, widget.title, widget.price);
                setState(() {
                  _isfavorite =
                      provider.favProducts.any((element) => element.imageUrl == widget.imageurl);
                });
              },
              icon: Icon(
                _isfavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
