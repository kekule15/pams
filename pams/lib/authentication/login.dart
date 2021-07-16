import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pams/authentication/forgotpassword.dart';
import 'package:pams/authentication/register.dart';
import 'package:pams/models/access_model/req_login_model.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/homepage.dart';
import 'package:pams/services/api_services/repositories/users_repository.dart';
import 'package:pams/utils/connection_status.dart';
import 'package:pams/utils/validators.dart';

class LoginPage extends HookWidget {
  final obscurePasswordProvider = StateProvider<bool>((ref) {
    return true;
  });

  final pendingLoginProvider = StateProvider<bool>((ref) {
    return false;
  });

  final _formKey = GlobalKey<FormState>();
  bool hidePassWord = true;
  @override
  Widget build(BuildContext context) {
    final _emailTextController = useTextEditingController();
    final _passwordTextController = useTextEditingController();
    useProvider(pendingLoginProvider);

    final _keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    bool _keyboardVisible = false;

    _keyboardHeight == 0 ? _keyboardVisible = false : _keyboardVisible = true;

    useProvider(obscurePasswordProvider);

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
                  key: _formKey,
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
                          controller: _emailTextController,
                          validator: (value) {
                            return Validators.isEmailStr(value.toString());
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          controller: _passwordTextController,
                          obscureText:
                              context.read(obscurePasswordProvider).state,
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
                                icon: Icon(
                                  context.read(obscurePasswordProvider).state
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black54,
                                  semanticLabel: context
                                          .read(obscurePasswordProvider)
                                          .state
                                      ? 'show password'
                                      : 'hide password',
                                ),
                                onPressed: () {
                                  context.read(obscurePasswordProvider).state =
                                      !context
                                          .read(obscurePasswordProvider)
                                          .state;
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
                      context.read(pendingLoginProvider).state
                          ? Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                              valueColor: AlwaysStoppedAnimation(
                                  Colors.white.withOpacity(0.3)),
                            ))
                          : MaterialButton(
                              color: Colors.red,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  context.read(pendingLoginProvider).state =
                                      true;

                                  if (await ConnectionStatus.isConnected(
                                      context)) {
                                    String emailAddress =
                                        _emailTextController.text.toString();

                                    String password =
                                        _passwordTextController.text.toString();

                                    final result =
                                        await UsersRepository.loginUser(
                                            ReqLoginModel(
                                                email: emailAddress,
                                                password: password));

                                    if (result.error == false) {
                                      context.read(pendingLoginProvider).state =
                                          false;
                                      print("Wrong Credentials");
                                      Fluttertoast.showToast(
                                          msg: "Wrong Credentials Entered");
                                    } else {
                                      context.read(pendingLoginProvider).state =
                                          true;
                                      print("======Logged In========");
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              Routes.home, (route) => false);
                                    }
                                    print(
                                        " ${result.data} ====== +++++ =======");
                                  } else {
                                    context.read(pendingLoginProvider).state =
                                        false;
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please check your internet connection");
                                  }
                                }
                              },
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
