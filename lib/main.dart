import 'package:flutter/material.dart';
import 'package:shoe_store_flutter/screens/shoes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoesScreen(),
    );
  }
}
