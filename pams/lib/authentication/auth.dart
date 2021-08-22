import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/login.dart';
import 'package:pams/authentication/register.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#26E07F"),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/backgroundImage.PNG"))),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/logoo.png"))),
                ),
                Expanded(child: Container()),
                BottomAppBar(
                  color: Colors.transparent,
                  child: _buttons(),
                  elevation: 0,
                ),
                // Expanded(
                //   child: Align(
                //     alignment: FractionalOffset.bottomCenter,
                //     child: _buttons(),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }

  _buttons() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
              height: 45,
              minWidth: 600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 30),
          //   child: MaterialButton(
          //     color: Colors.white,
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => RegisterPage()));
          //     },
          //     child: Text(
          //       "Register",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //     height: 45,
          //     minWidth: 600,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(40))),
          //   ),
          // ),
        ],
      ),
    );
  }
}
