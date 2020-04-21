import 'package:betacov/dashboard/widget/HomeOfflineWidget.dart';
import 'package:betacov/dashboard/widget/HomeWidget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF3215A4),
    ));
    return OfflineBuilder(
      debounceDuration: Duration.zero,
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          return HomeOfflineWidget();
        }
        return child;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFEFEFE),
        body: HomeWidget(),
      ),
    );
  }
}
