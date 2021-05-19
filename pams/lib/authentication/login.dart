import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/forgotpassword.dart';
import 'package:pams/authentication/register.dart';
import 'package:pams/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassWord = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/backgroundImage.PNG"))),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/logoo.png"))),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                decoration: BoxDecoration(
                    color: HexColor("#F5F5F5"),
                    borderRadius: BorderRadius.circular(20)),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text("Login to get started",
                            style: TextStyle(fontSize: 18)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          validator: (input) => !input.contains("@")
                              ? "Email Id should be valid"
                              : null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_rounded,
                              color: HexColor("#F58E34"),
                              size: 22,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: HexColor("#30F58E34")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#F58E34"))),
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 6
                              ? "Password should be at least 6 characters"
                              : null,
                          obscureText: hidePassWord,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor("#30F58E34"),
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#F58E34"))),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: HexColor("#F58E34"),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(hidePassWord
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePassWord = !hidePassWord;
                                  });
                                },
                                color: HexColor("#60F58E34")),
                            hintText: 'password',
                          ),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPassword()));
                        },
                        child: Text('Forgot Password'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Do not have an account?',
                            style: TextStyle(),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text('Register',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: MaterialButton(
                          onPressed: () {
                            final form = formKey.currentState;
                            if (form.validate()) {
                              form.save();
                              return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(
                                            currentPage: 0,
                                          )));
                            }
                          },
                          minWidth: 600,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          height: 38,
                          color: HexColor("#F58E34"),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
