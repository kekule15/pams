import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pams/screens/clients/fieldsampling.dart';
import 'package:pams/screens/notification.dart';
import 'package:pams/screens/profile.dart';
import 'package:pams/screens/test.dart';
import 'package:pams/utils/custom_colors.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? myName;
  String? role;
  @override
  void initState() {
    super.initState();
    getDetails();
  }

  Future getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('fullname');
    var drole = prefs.getString('role');
    setState(() {
      myName = name;
      role = drole;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              decoration: BoxDecoration(
                  color: CustomColors.mainDarkGreen,
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/backgroundImage.PNG')),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.white,
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            //color: HexColor("#44F599")),
                            child: Icon(Icons.notification_important,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/avatar.png")),
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 4.0,
                                ),
                                shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$myName',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20)),
                              Text('$role',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Tasks',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  // Container(
                  //   height: 30,
                  //   width: 30,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.lightBlueAccent),
                  //   child: Icon(
                  //     Icons.calendar_today_outlined,
                  //     color: Colors.white,
                  //     size: 15,
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.red.shade300, shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 17,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Failed',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      Text(
                        '5 tasks failed',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.orange, shape: BoxShape.circle),
                      child: Icon(
                        Icons.timelapse_outlined,
                        color: Colors.white,
                        size: 17,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pending',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      Text(
                        '3 task pending',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 17,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivered',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      Text(
                        '9 tasks delivered',
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'What do you want to do today?',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FieldSampling()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 0.5), // changes position of shadow
                            ),
                          ],
                          color: CustomColors.Darkblue,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          SvgPicture.asset('assets/sampling.svg'),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            'Sampling',
                            style: TextStyle(
                                color: CustomColors.background,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ))
                        ]),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActivityPage()));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 0.5), // changes position of shadow
                            ),
                          ],
                          color: CustomColors.mainDarkOrange,
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          SvgPicture.asset('assets/report.svg'),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text('Report',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)))
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
