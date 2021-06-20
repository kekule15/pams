import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/editemail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: HexColor("#26E07F"),
        title: Text("Profile",
            style: TextStyle(color: Colors.white, fontSize: 20)),
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
              Text("Henry Joe",
                  style: TextStyle(fontSize: 30, color: HexColor("#072468"))),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 350,
                decoration: BoxDecoration(boxShadow: [
                  // to make elevation
                  BoxShadow(
                    color: Colors.grey[300],
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
                      Text("Henry Joe",
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
                    color: Colors.grey[300],
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
                      Text("Designation",
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
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 350,
                decoration: BoxDecoration(boxShadow: [
                  // to make elevation
                  BoxShadow(
                    color: Colors.grey[300],
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
                          Text("henryJoe@gmail.com",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#072468"))),
                          Text("Email address",
                              style: TextStyle(
                                  fontSize: 12, color: HexColor("#072468"))),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditEmail()));
                        },
                        child: Icon(Icons.arrow_forward_ios_sharp,
                            color: HexColor("#F58E34")),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  print("======Logout=======");
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("email");
                  Navigator.of(context).pushNamed(Routes.authPage);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(boxShadow: [
                    // to make elevation
                    BoxShadow(
                      color: Colors.grey[300],
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
}
