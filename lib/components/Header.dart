import 'package:betacov/screens/AppInfo.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  final TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  final TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  final TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  final image;

  Header({this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -1,
          child: Container(
            height: 35.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "BETA",
                    style: styleBold.copyWith(
                        color: Color(0xFFFFFFFF), fontSize: 24.0),
                  ),
                  TextSpan(
                    text: "COV",
                    style: styleBold.copyWith(
                        color: Color(0xFFF65C8C),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Container(
                height: 40.00,
                width: 40.00,
                decoration: BoxDecoration(
                  color: Color(0xff6524ad),
                  borderRadius: BorderRadius.circular(15.00),
                ),
                child: PopupMenuButton(
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      child: GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.share, color: Color(0xffB6B6B6)),
                            SizedBox(width: 8.0),
                            Text(
                              "Share BETACOV",
                              style: styleMedium.copyWith(fontSize: 14.0),
                            ),
                          ],
                        ),
                        onTap: () async => await _shareText(),
                      ),
                      value: 'Lion',
                    ),
                    PopupMenuItem<String>(
                      child: GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.info, color: Color(0xffB6B6B6)),
                            SizedBox(width: 8.0),
                            Text(
                              "Tentang BETACOV",
                              style: styleMedium.copyWith(fontSize: 14.0),
                            ),
                          ],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AppInfo()),
                        ),
                      ),
                      value: 'Lion',
                    ),
                    PopupMenuItem<String>(
                      child: GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_download,
                                color: Color(0xffB6B6B6)),
                            SizedBox(width: 8.0),
                            Text(
                              "Update Aplikasi",
                              style: styleMedium.copyWith(fontSize: 14.0),
                            ),
                          ],
                        ),
                        onTap: () => _launchInBrowser("http://fawazalrasyid.xyz/betacov/"),
                      ),
                      value: 'Update',
                    ),
                  ],
                  onSelected: (_) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _shareText() async {
    try {
      Share.text(
          "Share BETACOV",
          "Download aplikasi BETACOV (Bengkulu Tanggap COVID-19) untuk informasi terbaru mengenai COVID-19 di Bengkulu. https://bit.ly/getBETACOV",
          'text/plain');
    } catch (e) {
      print('error: $e');
    }
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

  // Future<void> _shareImage() async {
  //   try {
  //     final ByteData bytes =
  //         await rootBundle.load('assets/images/bg-ornament-home.png');
  //     await Share.file('Share BETACOV', 'betacov.png',
  //         bytes.buffer.asUint8List(), 'image/png',
  //         text:
  //             "Download aplikasi BETACOV (Bengkulu Tanggap COVID-19) untuk informasi terbaru mengenai COVID-19 di Bengkulu. http://kcov.id/app");
  //   } catch (e) {
  //     print('error: $e');
  //   }
  // }
}
