import 'dart:async';
import 'package:flutter/material.dart';
import 'package:authwebview/home_page.dart';

import 'helper.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(Helper.getHexToInt("#006A4E")),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration:new BoxDecoration(
                image:  new DecorationImage(
                  image: new AssetImage("images/banglasplash.jpg"),
                  fit: BoxFit.cover,)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
