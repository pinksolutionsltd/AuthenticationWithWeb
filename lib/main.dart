import 'package:flutter/material.dart';
import 'network_check.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweak & Eat',
      home: CheckNetworkPage(),

    );
  }
}

