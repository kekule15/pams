import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/login.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _logo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor("#26E07F"),
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/backgroundImage.PNG"))),
          ),
          _logo
              ? Visibility(
                  visible: _logo,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/logoo.png"))),
                  ),
                )
              : Visibility(child: LoginPage()),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buttons(),
          )
        ],
      )),
    );
  }

  _buttons() {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _logo = false;
              });
            },
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: HexColor("#F5F5F5")),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: HexColor("#F5F5F5")),
              child: Center(
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
