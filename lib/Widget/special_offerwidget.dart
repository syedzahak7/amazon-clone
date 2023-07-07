import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/detail_screen.dart';
import '../modules/special_offer.dart';
import '../provider/productprovider.dart';

class SpecialOfferWidget extends StatefulWidget{
  const SpecialOfferWidget(
      this.context, {
        Key? key,
        required this.data,
        required this.index,
      }) : super(key: key);

  final SpecialOffer data;
  final BuildContext context;
  final int index;

  @override
  State<SpecialOfferWidget> createState() => _SpecialOfferWidgetState();
}

class _SpecialOfferWidgetState extends State<SpecialOfferWidget> {
  bool _isfavorite=false;

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProductProvider>(context);
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){


          provider.addtofav(widget.data.icon, widget.data.title, 455);
          // _isfavorite=!_isfavorite;
          setState(() {
          _isfavorite =provider.favProducts.any((element) => element.imageUrl==widget.data.icon);

          });

          },
            child: CircleAvatar(
                radius: 17,
                backgroundColor: Colors.black,
                child: Icon(_isfavorite?Icons.favorite:Icons.favorite_border,color: Colors.white,size: 20,)),
          ),
        ),
        InkWell(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopDetailScreen(name: widget.data.title, price: 280, imageUrls: [widget.data.icon],))),
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
                        widget.data.discount,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.data.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.data.detail,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(widget.data.icon),
            ],
          ),
        ),
      ],
    );
  }
}