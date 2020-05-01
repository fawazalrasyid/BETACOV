import 'package:betacov/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeOfflineWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF3215A4),
    ));
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/offline.png",
              width: 200.0,
            ),
            SizedBox(height: 8.0),
            Text(
              "Whoops!",
              style: styleBold.copyWith(fontSize: 22, color: Color(0xFF353535)),
            ),
            SizedBox(height: 4.0),
            Text(
              "Tidak ada koneksi internet.\nCek koneksimu dan coba lagi.",
              style: styleBold.copyWith(fontSize: 12, color: Color(0xFF353535)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
