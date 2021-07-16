import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pams/authentication/auth.dart';
import 'package:pams/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  _transitionToNextPageAfterSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
    return Timer(
      Duration(
        seconds: 3,
      ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => email== null? AuthPage(): HomePage(currentPage: 0,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            width: 350,
            height: 240,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/logoo.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
