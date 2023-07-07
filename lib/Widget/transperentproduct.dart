import 'package:amazon_clone/Screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productprovider.dart';
import 'imagecontent.dart';

class TransparentImageCard extends StatefulWidget{
   TransparentImageCard({
    Key? key,
    this.width,
    this.height,
    this.contentMarginTop,
    this.borderRadius = 6,
    this.contentPadding,
    required this.imageurl,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.startColor,
    this.endColor,
    this.tagSpacing,
    this.tagRunSpacing,
  }) : super(key: key);

  /// card width
  final double? width;

  /// card height
  final double? height;

  /// padding from top of card to content
  final double? contentMarginTop;

  /// border radius value
  final double borderRadius;

  /// spacing between tag
  final double? tagSpacing;

  /// run spacing between line tag
  final double? tagRunSpacing;

  /// content padding
  final EdgeInsetsGeometry? contentPadding;

  /// image provider
  final String imageurl;

  /// list of widgets
  final List<Widget>? tags;

  /// color gradient start, default [0xff575757] with opacity 0
  final Color? startColor;

  /// color gradient end, default [0xff000000]
  final Color? endColor;

  /// widget title of card
  final String? title;

  /// widget description of card
  final Widget? description;

  /// widget footer of card
  final Widget? footer;

  @override
  State<TransparentImageCard> createState() => _TransparentImageCardState();
}

class _TransparentImageCardState extends State<TransparentImageCard> {
  bool _isfavorite=false;

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProductProvider>(context);
    final Widget content = ImageCardContent(
      contentPadding: widget.contentPadding,
      tags: widget.tags,
      title:Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text( widget.title!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),
      ),
      footer: widget.footer,
      description: Padding(
        padding: EdgeInsets.only(left: 10),
          child: widget.description),
      tagSpacing: widget.tagSpacing,
      tagRunSpacing: widget.tagRunSpacing,
    );

    return Stack(
      children:[
        GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ShopDetailScreen(name:widget.title!, price: 299, imageUrls: [widget.imageurl],))),
            child: _buildBody(content)),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
              backgroundColor: Colors.black,
              child: IconButton(onPressed:(){


                  provider.addtofav(widget.imageurl, widget.title!, 455);
               // _isfavorite=!_isfavorite;
                setState(() {
                  _isfavorite =provider.favProducts.any((element) => element.imageUrl==widget.imageurl);

                });

              }, icon: Icon(_isfavorite?Icons.favorite:Icons.favorite_border,color: Colors.white,))),
        )
      ]
    );
  }

  Widget _buildBody(Widget content) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: ShaderMask(
            shaderCallback: (bound) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  widget.startColor ?? const Color(0xff575757).withOpacity(0),
                  widget.endColor ?? const Color(0xff000000),
                ],
                //tileMode: TileMode.,
              ).createShader(bound);
            },
            blendMode: BlendMode.srcOver,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                image: DecorationImage(
                  image: AssetImage(widget.imageurl),
                  fit: BoxFit.cover,
                ),
                //tileMode: TileMode.,
              ),
              padding: EdgeInsets.only(top: widget.contentMarginTop ?? 100),
              child: content,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: Colors.transparent,
            ),
            padding: EdgeInsets.only(top: widget.contentMarginTop ?? 100),
            child: content,
          ),
        ),
      ],
    );
  }
}