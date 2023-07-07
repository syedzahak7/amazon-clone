import 'package:flutter/material.dart';
final ThemeData myTheme=ThemeData(
  scaffoldBackgroundColor: GlobalVariables.backgroundColor,
   primaryColor:const Color.fromARGB(255, 35, 47, 62),
  appBarTheme: const AppBarTheme(

    backgroundColor: Colors.amber,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white
    )
  ),

  fontFamily: 'Roboto'
);
class GlobalVariables {
  static const appBarGradient=LinearGradient(
      colors:[
      Color.fromARGB(255,29,201,192),
      Color.fromARGB(255,221,221,216),
  ],
  );
  static const backgroundColor=Colors.white;
  static const secondaryColor=Color.fromRGBO(255, 153, 0, 0);
 static const Color greyBackgroundColor =Color(0xffebecee);
  static var selectedNavBarColor=Colors.cyan[800]!;
}
