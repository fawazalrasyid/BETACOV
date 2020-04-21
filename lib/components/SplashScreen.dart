import 'dart:async';
import 'dart:ui';

import 'package:betacov/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    //SystemChrome.restoreSystemUIOverlays();
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/splashscreen.png",
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
