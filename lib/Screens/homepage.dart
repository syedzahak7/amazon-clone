import 'package:amazon_clone/Screens/cartscreen.dart';
import 'package:amazon_clone/Widget/appbaricon.dart';
import 'package:amazon_clone/Widget/drawerwidget.dart';
import 'package:amazon_clone/Widget/homeWidget.dart';
import 'package:amazon_clone/modules/special_offer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Widget/favoritewidget.dart';
import '../Widget/textfield_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SpecialOffer specialOffer;
  int i=0;
 void f(int a){
setState(() {
  i=a;
});



 }
  int _selectedIndex = 0;
  final List<Widget> _pages = [
  homeWidget(),
    Favorite(),
    Favorite(),
    Favorite(),
  ];
  @override
  Widget build(BuildContext context) {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  return Scaffold(
    key: scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace:Padding(
          padding: const EdgeInsets.only(top: 43.0,left: 12,right: 12),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
               GestureDetector(
                 onTap: (){ scaffoldKey.currentState?.openDrawer();},
                 child: SvgPicture.asset(
                    'images/menu.svg', // Replace with the path to your SVG image
                    color: Colors.white, // Optional: Specify a color for the SVG
                    width: 40, // Optional: Specify the width of the SVG
                    height: 40, // Optional: Specify the height of the SVG
                  ),
               ),

             Image.asset('images/pngegg.png',scale: 1,width: 170,height: 70,),
              IconButton(onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routname);
              },
                  icon:const Icon(Icons.shopping_cart,size: 35,color: Colors.white,)),
            ],
          ),
        ) ,
        toolbarHeight: MediaQuery.of(context).size.height * 0.25,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: TextFieldCard(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5,left: 30.0,bottom: 10),
                child: Text('Best Collections',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:[
                    AppBarIcon(CupertinoIcons.device_phone_portrait,'Mobiles'),
                    AppBarIcon(CupertinoIcons.car_detailed,'Cars'),
                    AppBarIcon(Icons.toys,'Toys'),
                    AppBarIcon(Icons.tv,'Electronics'),
                    AppBarIcon(Icons.radio,'Radio'),
                    AppBarIcon(Icons.earbuds,'Earbuds'),
                    AppBarIcon(Icons.science_outlined,'Science'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),

      body:  _pages[_selectedIndex],
        //if(i==0)

      // else if(i==2)
      // const Favorite(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.chart_bar, 1),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.heart, 2),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(CupertinoIcons.bell, 3),
            label: 'Notification',
          ),
        ],
      ),
    );
  }
  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _selectedIndex == index ? Colors.transparent : Colors.grey,
          width: 2.0,
        ),
      ),
      child: Icon(icon),
    );
  }
  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      //widget.onChange(index);
    });
  }
}
