import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/routes/routes.dart';
import 'package:pams/screens/album/album_page.dart';
import 'package:pams/screens/faq.dart';
import 'package:pams/screens/fieldsampling.dart';
import 'package:pams/screens/notification.dart';
import 'package:pams/screens/profile.dart';
import 'package:pams/screens/test.dart';
import 'package:pams/utils/shared_pref_manager.dart';
import 'package:pams/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final int currentPage;
  const HomePage({
    //required Key key,
    required this.currentPage,
  });
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tapCounter = 0;
  bool tapped = false;
  ValueNotifier<int>? currentPage;
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        elevation: 20,
        currentIndex: _currentIndex!,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: [
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              size: 40,
              color: HexColor("#26E07F"),
            ),
            label: "Home",
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.restore_page,
              size: 40,
              color: HexColor("#26E07F"),
            ),
            label: "Activity",
          ),
          new BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.question_answer,
              size: 40,
              color: HexColor("#26E07F"),
            ),
            label: "Faq",
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: _children[_currentIndex!],
    );
  }

  final List<Widget> _children = [
    HomeView(),
    ActivityPage(),
    FAQPage(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String myName = '';
  String role = '';
  _HomeViewState() {
    Prefs.instance.getStringValue("name").then((value) => setState(() {
          myName = value;
        }));
    Prefs.instance.getStringValue("role").then((value) => setState(() {
          role = value;
        }));
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
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.9,
              decoration: BoxDecoration(
                  color: HexColor("#26E07F"),
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/backgroundImage.PNG')),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.profileScreen);
                            },
                            icon: Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.white,
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.notification);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: HexColor("#44F599")),
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
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Tasks',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlueAccent),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red.shade300,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.lock_clock,
                            color: Colors.white,
                            size: 17,
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To Do',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Text(
                            'Task to do',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                          Text('In progress',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Text(
                            '1 task in progress',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
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
                          Text('Done',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              )),
                          Text(
                            '3 tasks completed',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black45),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Active projects',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => MyAbumPage()));
                           Navigator.of(context).pushNamed(Routes.fieldSampling);
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
                                  offset: Offset(
                                      0, 0.5), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 120,
                                  child: Image.asset("assets/field.png")),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text(
                                'Field Sampling',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ))
                            ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.viewActivity);
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
                                  offset: Offset(
                                      0, 0.5), // changes position of shadow
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Container(
                                  height: 80,
                                  width: 120,
                                  child:
                                      Image.asset("assets/view_acticity.png")),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                  child: Text('View Activity',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)))
                            ]),
                          ),
                        ),
                      )
                    ],
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
