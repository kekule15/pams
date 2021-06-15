import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/screens/faq.dart';
import 'package:pams/screens/fieldsampling.dart';
import 'package:pams/screens/notification.dart';
import 'package:pams/screens/profile.dart';
import 'package:pams/screens/test.dart';

class HomePage extends StatefulWidget {
  final int currentPage;
  const HomePage({
    Key key,
    @required this.currentPage,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tapCounter = 0;
  bool tapped = false;
  ValueNotifier<int> currentPage;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentPage ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        elevation: 20,
        currentIndex: _currentIndex,
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
      body: _children[_currentIndex],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white,
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()));
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
                            Text("Hi Henry",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20)),
                            Text('App Developer',
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
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
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
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                        Text(
                          'Task to do',
                          style: TextStyle(fontSize: 14, color: Colors.black45),
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
                        height: 40,
                        width: 40,
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
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                        Text(
                          '1 task in progress',
                          style: TextStyle(fontSize: 14, color: Colors.black45),
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
                        height: 40,
                        width: 40,
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
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                        Text(
                          '3 tasks completed',
                          style: TextStyle(fontSize: 14, color: Colors.black45),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
