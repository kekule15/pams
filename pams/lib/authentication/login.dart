import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/forgotpassword.dart';
import 'package:pams/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Container(
              width: 220,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/logoo.png"))),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 5,
              ),
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  color: HexColor("#F5F5F5"),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text("Login to get started",
                            style: TextStyle(fontSize: 18)),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text("Forgot Password?"),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        currentPage: 0,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: HexColor("#F58E34"),
                          ),
                          child: Center(
                            child: Text("Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
