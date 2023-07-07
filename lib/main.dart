import 'package:amazon_clone/Screens/auth/authscreen.dart';
import 'package:amazon_clone/Screens/auth/loginscreen.dart';
import 'package:amazon_clone/provider/productprovider.dart';
import 'package:amazon_clone/utilis.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/homepage.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

