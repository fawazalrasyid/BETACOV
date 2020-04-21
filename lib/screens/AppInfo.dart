import 'package:betacov/components/Header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF3215A4),
          elevation: 0.0,
        ),
      ),
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: Column(
            children: <Widget>[
              Header(
                image: "assets/images/bg-ornament-tentang.png",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tentang BETACOV",
                      style: styleBold.copyWith(
                          fontSize: 18.0, color: Color(0xff353535)),
                    ),
                    SizedBox(height: 8.0),
                    buildCardInfo(),
                    SizedBox(height: 32.0),
                    Text(
                      "Informasi Pengembang",
                      style: styleBold.copyWith(
                          fontSize: 18.0, color: Color(0xff353535)),
                    ),
                    SizedBox(height: 8.0),
                    buildPengembang(),
                    SizedBox(height: 64.0),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "App Version 1.0.0",
                            style: styleRegular.copyWith(
                                fontSize: 14, color: Color(0xff353535)),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(48.0, 0.0, 48.0, 0.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: "Made with ❤ by",
                                  style: styleRegular.copyWith(
                                      fontSize: 12, color: Color(0xff353535)),
                                ),
                                TextSpan(
                                  text: " Fawaz Al Rasyid",
                                  style: styleBold.copyWith(
                                      fontSize: 12, color: Color(0xff353535)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _launchInBrowser(
                                        "http://fawazalrasyid.xyz/"),
                                ),
                                TextSpan(
                                  text: " - Design by",
                                  style: styleRegular.copyWith(
                                      fontSize: 12, color: Color(0xff353535)),
                                ),
                                TextSpan(
                                  text: " HeySaladin",
                                  style: styleBold.copyWith(
                                      fontSize: 12, color: Color(0xff353535)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => _launchInBrowser(
                                        "https://heyheysaladin.web.app/"),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(height: 8.0)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 2.00),
            color: Color(0xff000002).withOpacity(0.06),
            blurRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(18.00),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("assets/images/betacov-logo.png", height: 70.0),
                SizedBox(width: 18.0),
                Text(
                  "BETACOV",
                  style: styleBold.copyWith(
                      fontSize: 16, color: Color(0xff353535)),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "BETACOV (Bengkulu Tanggap Covid) adalah aplikasi yang dibuat untuk mempermudah mendapatkan informasi terbaru mengenai COVID-19 di Bengkulu.",
              style:
                  styleMedium.copyWith(fontSize: 12, color: Color(0xff353535)),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildPengembang() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 2.00),
              color: Color(0xff000002).withOpacity(0.06),
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(18.00),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/images/fawazalrasyid.png", height: 50.0),
                  SizedBox(width: 18.0),
                  Text(
                    "Fawaz Al Rasyid",
                    style: styleMedium.copyWith(
                        fontSize: 16, color: Color(0xff353535)),
                  ),
                ],
              ),
              GestureDetector(
                child: Icon(Icons.arrow_right, color: Colors.black, size: 30.0),
                onTap: () => _launchInBrowser("http://fawazalrasyid.xyz/"),
              )
            ],
          ),
        ),
      ),
      onTap: () => _launchInBrowser("http://fawazalrasyid.xyz/"),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
