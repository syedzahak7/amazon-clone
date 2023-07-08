import 'package:flutter/material.dart';
import '../Screens/orderscreen.dart';
import '../Screens/profilescreen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  Widget buildMenuItem(String text,GestureTapCallback onTap ,BuildContext context) {

    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'John Doe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            accountEmail: null, // Set accountEmail to null if not needed
            currentAccountPicture: GestureDetector(
              onTap:()=> Navigator.of(context).pushNamed(ProfilePage.routname),
              child: const Hero(
                tag: 'profile',
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/download.jpeg'),
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildMenuItem('Home',(){} ,context),
                buildMenuItem('Shop by Category',(){} ,context),
                buildMenuItem('Our Orders',(){
                  Navigator.of(context).pushNamed(OrderScreen.routname);

                }, context),
                buildMenuItem('Buy Again',(){}, context),
                buildMenuItem('Your Wishlist',(){}, context),
                buildMenuItem('Your Account',(){}, context),
                buildMenuItem('Amazon Pay',(){}, context),
                buildMenuItem('Prime',(){}, context),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.grey),
          ListTile(
            title: const Text(
              'Log Out',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle log out click here
            },
          ),
        ],
      ),
    );
  }
}
