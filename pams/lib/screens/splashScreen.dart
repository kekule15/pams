import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pams/authentication/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _transitionToNextPageAfterSplash();
    super.initState();
  }

  _transitionToNextPageAfterSplash() {
    return Timer(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context)=>LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/logoo.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
