import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        backgroundColor: CustomColors.lightDarkGreen,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/auth_logo.svg',
                height: 150,
                width: 350,
              ),
            ),
            SizedBox(
              height: 20,
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
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: CustomColors.mainDarkGreen,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 20, color: CustomColors.background),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Already have an account?',
                style: TextStyle(
                  color: CustomColors.blackColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Center(
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 20,
                    color: CustomColors.mainDarkGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // BottomAppBar(
            //   color: Colors.transparent,
            //   child: _buttons(),
            //   elevation: 0,
            // ),
            // Expanded(
            //   child: Align(
            //     alignment: FractionalOffset.bottomCenter,
            //     child: _buttons(),
            //   ),
            // )
          ],
        ));
  }
}
