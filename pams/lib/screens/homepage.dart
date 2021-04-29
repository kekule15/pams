import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pams/screens/faq.dart';
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
            label: "Test",
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
    TestPage(),
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
            height: 350,
            decoration: BoxDecoration(
                color: HexColor("#26E07F"),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 70, 20, 0),
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
                            height: 90,
                            width: 70,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/avatar.png")),
                                border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 6.0,
                                ),
                                shape: BoxShape.circle),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Hi Henry",
                            style: TextStyle(color: Colors.white, fontSize: 23))
                      ],
                    ),
                    InkWell(
                      onTap: () {},
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
              child: Column(
                children: <Widget>[
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(top: 70),
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: HexColor("#072468"),
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
                        child: Text("Field Sampling",
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
                                fontSize: 23,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(currentPage: 1)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                        child: Text("View Activity",
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
                                fontSize: 23,
                                color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
