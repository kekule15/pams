import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/authentication/auth.dart';
import 'package:pams/authentication/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/backgroundImage.PNG"))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/logoo.png"))),
            ),
            Expanded(
              child: ListView(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text("Register to get started",
                              style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            validator: (input) => input!.length < 6
                                ? "First name should not be empty"
                                : null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box_sharp,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: ' First name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (input) => input!.length < 6
                                ? "Last name should not be empty"
                                : null,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box_sharp,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: ' Last name',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            validator: (input) => input!.length < 11
                                ? "Phone number should be at least 11 characters"
                                : null,
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'Phone number',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            validator: (input) => !input!.contains("@")
                                ? "Email Id should be valid"
                                : null,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'Email',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (input) => input!.length < 6
                                ? "Password should be at least 6 characters"
                                : null,
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'password',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            maxLength: 4,
                            validator: (input) => input!.length < 4
                                ? "Activation code should be at least 4 characters"
                                : null,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.volunteer_activism,
                                color: HexColor("#F58E34"),
                                size: 22,
                              ),
                              hintText: 'Activation code',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: HexColor("#30F58E34")),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: HexColor("#F58E34"))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Already have an Account?'),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: MaterialButton(
                            color: HexColor("#F58E34"),
                            height: 40,
                            minWidth: 600,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            onPressed: () {
                              final form = formKey.currentState;
                              if (form!.validate()) {
                                form.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthPage()));
                              }
                            },
                            child: Text("Register",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
