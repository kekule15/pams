import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pams/authentication/auth_implementation.dart';
import 'package:pams/authentication/forgotpassword.dart';
import 'package:pams/authentication/register.dart';
import 'package:pams/screens/homepage.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:pams/utils/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassWord = true;
  bool btnState = false;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool autoValidate = false;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff194A00),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(
                'assets/login_img.svg',
                height: 300,
                width: 500,
              ),
            ),
            SizedBox(height: 40),
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: BoxDecoration(
                  color: CustomColors.lightDarkGreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Form(
                key: _formKey,
                autovalidate: autoValidate,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        controller: _emailTextController,
                        validator: (value) {
                          return Validators.isEmailStr(value.toString());
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: CustomColors.mainDarkGreen,
                            size: 28,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColors.mainDarkGreen,
                            ),
                          ),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: CustomColors.mainDarkGreen,
                                style: BorderStyle.solid),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            size: 28,
                            color: CustomColors.mainDarkGreen,
                          ),
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: CustomColors.mainDarkGreen,
                              )),
                        )
                      ],
                    ),
                    InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: CustomColors.mainDarkGreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Center(
                              child: btnState
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: CustomColors.background,
                                      ),
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          validateInputs();
                        }),
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
    );
  }

  validateInputs() async {
    setState(() {
      btnState = true;
    });
    var state = _formKey.currentState;
    if (!state!.validate()) {
      setState(() {
        autoValidate = true;
        btnState = false;
      });
    } else {
      state.save();

      Map<String, dynamic> result = await AuthImplementation()
          .userLogin(
              email: _emailTextController.text.toString(),
              password: _passwordTextController.text.toString())
          .catchError((error) {
        setState(() {
          btnState = false;
        });
        Fluttertoast.showToast(
            msg: 'Oosp something went wrong...Please try again later');
      });

      if (result['status'] = true) {
        setState(() {
          btnState = false;
        });
        Fluttertoast.showToast(msg: '${result['message']}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', '${result['returnObject']['email']}');
        prefs.setString('fullname', '${result['returnObject']['fullname']}');
        prefs.setString('role', '${result['returnObject']['role'][0]}');
        prefs.setString('apiToken', '${result['returnObject']['token']}');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeView()),
            (route) => false);
      } else {
        setState(() {
          btnState = false;
        });
        Fluttertoast.showToast(msg: '${result['message']}');
      }
    }
  }
}
