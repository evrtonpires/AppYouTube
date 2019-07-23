import 'package:flutter/material.dart';
import 'package:youtub/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTube',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

 