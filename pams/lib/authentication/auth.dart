import 'package:flutter/material.dart';
import 'package:pams/authentication/login.dart';
import 'package:pams/authentication/register.dart';
import 'package:pams/utils/custom_colors.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:CustomColors.background,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/backgroundImage.PNG"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/logoo.png"))),
              ),
              SizedBox(
                height: 50,
              ),
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
                style:
                    TextStyle(fontSize: 20, color: CustomColors.mainDarkGreen),
              ),
              height: 45,
              minWidth: 600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: MaterialButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                "Register",
                style:
                    TextStyle(fontSize: 20, color: CustomColors.mainDarkGreen),
              ),
              height: 45,
              minWidth: 600,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ],
      ),
    );
  }
}
