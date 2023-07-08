import 'package:amazon_clone/Screens/viewallproductscreen.dart';
import 'package:amazon_clone/Screens/specialofferscreen.dart';
import 'package:amazon_clone/Widget/cardproduct.dart';
import 'package:amazon_clone/Widget/transperentproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/productprovider.dart';
class homeWidget extends StatelessWidget {
  const homeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ProductProvider>(context);
    return  ListView(
      physics: const ClampingScrollPhysics(), // Add this line to disable scrolling physics
      children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Products',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ViewAllScreen(appbar: 'Popular Products')),
                  );
                },
                child: Text('View All', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: MediaQuery.of(context).size.height * 0.23, // Specify the height
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: provider.popularProducts.length,
            itemBuilder: (context, i) => TransparentImageCard(
              width: MediaQuery.of(context).size.width * 0.4, // Specify the width
              height: MediaQuery.of(context).size.height * 0.23, // Specify the height
              imageurl: provider.popularProducts[i].imageUrl,
              // tags: '[ _tag('Product', () {}), ]',
              title: provider.popularProducts[i].name,
              description: Text(
                provider.popularProducts[i].description!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Offers',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SpecialOfferScreen.routename);

                },
                child: Text('View All', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.23, // Specify the height
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: provider.specialOfferProducts.length,
            itemBuilder: (context, i) => ProductCardWidget(
              title: provider.specialOfferProducts[i].name,
              price: provider.specialOfferProducts[i].price,
              imageurl: provider.specialOfferProducts[i].imageUrl,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ViewAllScreen(appbar: 'Trendings')),
                  );
                },
                child: Text('View All', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: MediaQuery.of(context).size.height * 0.23, // Specify the height
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: provider.trendingProducts.length,
            itemBuilder: (context, i) => TransparentImageCard(
              width: MediaQuery.of(context).size.width * 0.4, // Specify the width
              height: MediaQuery.of(context).size.height * 0.23, // Specify the height
              imageurl: provider.trendingProducts[i].imageUrl,
              // tags: '[ _tag('Product', () {}), ]',
              title: provider.trendingProducts[i].name,
              description: Text(
                provider.trendingProducts[i].description!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );

  }
}
