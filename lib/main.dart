import 'package:flutter/material.dart';
import 'firstScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calman',
      debugShowCheckedModeBanner: false,
      home: First(),
    );
  }
}