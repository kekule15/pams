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
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 330,
            decoration: BoxDecoration(
                // color: HexColor("#26E07F"),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/backgroundImage.PNG')),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 50, 15, 0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                          },
                          child: Container(
                            height: 70,
                            width: 50,
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
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Hi Henry",
                            style: TextStyle(color: Colors.white, fontSize: 20))
                      ],
                    ),
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
                            shape: BoxShape.circle, color: HexColor("#44F599")),
                        child: Icon(Icons.notification_important,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 200),
                height: 400,
                child: Column(children: <Widget>[
                  Container(
                    height: 170,
                    width: 300,
                    decoration: BoxDecoration(
                        boxShadow: [
                          // to make elevation
                          BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(3, 2),
                            blurRadius: 4,
                          ),
                          // to make the coloured border
                          BoxShadow(
                            color: HexColor("#F58E34"),
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Text("Welcome",
                              style: TextStyle(
                                  color: HexColor("#072468"),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "What would you like to do?",
                            style: TextStyle(
                              color: HexColor("#072468"),
                              fontSize: 26,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FieldSampling()));
                          },
                          child: Container(
                            height: 110,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor("#F58E34"),
                              boxShadow: [
                                // to make elevation
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                ),
                                // to make the coloured border
                                // BoxShadow(
                                //   color: HexColor("#F58E34"),
                                //   offset: Offset(0, 4),
                                // ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.file_copy_rounded,
                                    color: Colors.white,
                                  ),
                                  Text("Field Sampling",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(0, 1.0),
                                              blurRadius: 3.0,
                                              color: Colors.grey[600],
                                            ),
                                            // Shadow(
                                            //   offset: Offset(10.0, 10.0),
                                            //   blurRadius: 8.0,
                                            //   color: Colors.grey,
                                            // ),
                                          ],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(currentPage: 1)));
                          },
                          child: Container(
                            height: 110,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: HexColor("#F58E34"),
                              boxShadow: [
                                // to make elevation
                                BoxShadow(
                                  color: Colors.grey[300],
                                  offset: Offset(4, 4),
                                  blurRadius: 6,
                                ),
                                // to make the coloured border
                                // BoxShadow(
                                //   color: HexColor("#F58E34"),
                                //   offset: Offset(0, 4),
                                // ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.restore_page,
                                  color: Colors.white,
                                ),
                                Text("View Activity",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        shadows: <Shadow>[
                                          Shadow(
                                            offset: Offset(0, 1.0),
                                            blurRadius: 3.0,
                                            color: Colors.grey[600],
                                          ),
                                          // Shadow(
                                          //   offset: Offset(10.0, 10.0),
                                          //   blurRadius: 8.0,
                                          //   color: Colors.grey,
                                          // ),
                                        ],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                        color: Colors.white)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }
}
