import 'package:betacov/dashboard/Bantuan.dart';
import 'package:betacov/dashboard/Home.dart';
import 'package:betacov/dashboard/Informasi.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  final PageStorageBucket bucket = PageStorageBucket();

  bool clickedCentreFAB = false;

  String imageIcon = "assets/images/informasi.png";
  Color colorActive = Color(0xFF5820AB);

  int _selectedIndex = 0;
  final _layoutPage = [
    Home(),
    Bantuan(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
      colorActive = Color(0xFF5820AB);
      clickedCentreFAB = false;
      imageIcon = !clickedCentreFAB
          ? "assets/images/informasi.png"
          : "assets/images/informasi_act.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _layoutPage.elementAt(_selectedIndex),
      body: Stack(
        children: <Widget>[
          _layoutPage.elementAt(_selectedIndex),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              height:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width:
                  clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              child: Informasi(),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              height: 26.0,
            ),
            activeIcon: Image.asset(
              "assets/images/home.png",
              height: 26.0,
              color: colorActive,
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/bantuan.png",
              height: 26.0,
            ),
            activeIcon: Image.asset(
              "assets/images/bantuan.png",
              height: 26.0,
              color: colorActive,
            ),
            title: Text(""),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB;
            imageIcon = clickedCentreFAB
                ? "assets/images/informasi_act.png"
                : "assets/images/informasi.png";
            colorActive = colorActive == Color(0xFF5820AB)
                ? Color(0xFFA197A1)
                : Color(0xFF5820AB);
          });
        },
        child: Container(
          child: Image.asset(
            imageIcon,
            height: 60.0,
          ),
        ),
      ),
    );
  }
}
