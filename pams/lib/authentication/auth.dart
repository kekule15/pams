import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/login.dart';
import 'package:pams/authentication/register.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool container1Color = true;
  bool text1Color = true;
  bool container2Color = true;
  bool text2Color = true;
  bool _logo = true;
  bool _login = false;
  bool _register = false;
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
          Visibility(
            visible: _logo,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/logoo.png"))),
            ),
          ),
          Visibility(visible: _login, child: LoginPage()),
          Visibility(visible: _register, child: RegisterPage()),
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
      height: 90,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                _logo = false;
                _login = true;
                _register = false;
                container1Color = true;
                text1Color = true;
                container2Color = false;
                text2Color = false;
              });
            },
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: container2Color
                      ? HexColor("#F5F5F5")
                      : Colors.transparent,
                  border: Border.all(
                    color: HexColor("#F5F5F5"),
                    style: BorderStyle.solid,
                    width: 2.0,
                  )),
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: text2Color ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            child: InkWell(
              onTap: () {
                setState(() {
                  _logo = false;
                  _login = false;
                  _register = true;
                  container1Color = false;
                  text1Color = false;
                  container2Color = true;
                  text2Color = true;
                });
              },
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: container1Color
                        ? HexColor("#F5F5F5")
                        : Colors.transparent,
                    border: Border.all(
                      color: HexColor("#F5F5F5"),
                      style: BorderStyle.solid,
                      width: 2.0,
                    )),
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: text1Color ? Colors.black : Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
