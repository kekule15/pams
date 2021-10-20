import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/editemail.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = '';
  String role = '';
  String email = '';

  _ProfilePageState() {
    Prefs.instance.getStringValue("name").then((value) => setState(() {
          name = value;
        }));
    Prefs.instance.getStringValue("role").then((value) => setState(() {
          role = value;
        }));
    Prefs.instance.getStringValue("email").then((value) => setState(() {
          email = value;
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        //backgroundColor: HexColor("#26E07F"),
        title: Text("Profile",
            style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 60),
                height: 110,
                width: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/avatar.png")),
                    border: Border.all(
                      color: HexColor("#26E07F"),
                      style: BorderStyle.solid,
                      width: 6.0,
                    ),
                    shape: BoxShape.circle),
              ),
              Text("$name",
                  style: TextStyle(fontSize: 30, color: HexColor("#072468"))),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 350,
                decoration: BoxDecoration(boxShadow: [
                  // to make elevation
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                  // to make the coloured border
                  BoxShadow(
                    color: HexColor("#072468"),
                    offset: Offset(0, 0.5),
                  ),
                ], color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("$name",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#072468"))),
                      Text("Account name",
                          style: TextStyle(
                              fontSize: 12, color: HexColor("#072468"))),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 350,
                decoration: BoxDecoration(boxShadow: [
                  // to make elevation
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                  // to make the coloured border
                  BoxShadow(
                    color: HexColor("#072468"),
                    offset: Offset(0, 0.5),
                  ),
                ], color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("$role",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#072468"))),
                      Text("Current position",
                          style: TextStyle(
                              fontSize: 12, color: HexColor("#072468"))),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditEmail()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(boxShadow: [
                    // to make elevation
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    // to make the coloured border
                    BoxShadow(
                      color: HexColor("#072468"),
                      offset: Offset(0, 0.5),
                    ),
                  ], color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("$email",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#072468"))),
                            Text("Email address",
                                style: TextStyle(
                                    fontSize: 12, color: HexColor("#072468"))),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_sharp,
                            color: HexColor("#F58E34")),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  // print("======Logout=======");
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // prefs.remove("email");
                  // Navigator.of(context).pushNamed(Routes.authPage);
                  _onWillPop();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(boxShadow: [
                    // to make elevation
                    BoxShadow(
                      color: Colors.grey[300]!,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                    // to make the coloured border
                    BoxShadow(
                      color: HexColor("#072468"),
                      offset: Offset(0, 0.5),
                    ),
                  ], color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text("Logout",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    print("======Logout=======");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('you want to Logout?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () {
                  prefs.remove("email");
                  Navigator.of(context).pushNamed(Routes.authPage);
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
