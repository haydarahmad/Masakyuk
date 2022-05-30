import 'package:flutter/material.dart';
import 'package:masakyuk/detailscreen.dart';
import 'package:masakyuk/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masakyuk',
      theme: ThemeData(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


