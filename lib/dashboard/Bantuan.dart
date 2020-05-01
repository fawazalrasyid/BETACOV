import 'package:betacov/components/Header.dart';
import 'package:betacov/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatefulWidget {
  @override
  _BantuanState createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  bool widgetRumahsakit = false;
  bool widgetCallcentre = false;

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
                image: "assets/images/bg-ornament-bantuan.png",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTitle(),
                    SizedBox(height: 32.0),
                    buildHotline(),
                    SizedBox(height: 32.0),
                    buildCard("assets/images/rumahsakit.png",
                        "Rumah Sakit Rujukan", "widgetRumahsakit"),
                    SizedBox(height: 14.0),
                    Container(
                      child: widgetRumahsakit ? buildRumahsakit() : null,
                    ),
                    SizedBox(height: 8.0),
                    buildCard("assets/images/callcenter.png",
                        "Call Center Kota/Kabupaten.", "widgetCallcentre"),
                    SizedBox(height: 14.0),
                    Container(
                      child: widgetCallcentre ? buildCallcenter() : null,
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

  Container buildTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pusat Bantuan",
            style: styleBold.copyWith(fontSize: 18.0, color: Color(0xff353535)),
          ),
          SizedBox(height: 4.0),
          Text(
            "Jika anda mengalami gejala-gejala seperti COVID-19, silahkan hubungi kotak di bawah.",
            style: styleBold.copyWith(fontSize: 12.0, color: Color(0xff818181)),
          ),
        ],
      ),
    );
  }

  Container buildHotline() {
    return new Container(
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 2.00),
            color: Color(0xff000002).withOpacity(0.06),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(18.00),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/phone.png", height: 24.0),
                SizedBox(width: 8.0),
                Text(
                  "Hotline",
                  style: styleBold.copyWith(
                      fontSize: 16.0, color: Color(0xff834FCD)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "119",
                      style: styleBold.copyWith(
                          fontSize: 40.0, color: Color(0xff353535)),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      "EXT 9",
                      style: styleMedium.copyWith(
                          fontSize: 24.0, color: Color(0xff353535)),
                    ),
                  ],
                ),
                RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xFFFFDADA))),
                  color: Color(0xFFEE0000),
                  child: Text(
                    "PANGGIL!",
                    style: styleBold.copyWith(
                        fontSize: 12, color: Color(0xFFFFFFFF)),
                  ),
                  onPressed: () => launch("tel:119"),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Divider(height: 2.0, color: Color(0xffE5E5E5)),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
            child: Text(
              "Jangan ragu untuk memanggil jika kondisi memang penting atau bahkan darurat!",
              style: styleBold.copyWith(fontSize: 12, color: Color(0xFF7E7E7E)),
            ),
          )
        ],
      ),
    );
  }

  Container buildCard(String icon, title, onpress) {
    String onn = onpress;
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/bg-ornament-card.png"),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 2.00),
            color: Color(0xff000002).withOpacity(0.06),
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(18.00),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Container(
              child: Image.asset(icon, height: 50.0),
            ),
            SizedBox(width: 18.0),
            Flexible(
              child: Text(
                title,
                style:
                    styleBold.copyWith(fontSize: 16, color: Color(0xffffffff)),
              ),
            ),
            SizedBox(width: 18.0),
            IconButton(
              icon: buildArrow(onn),
              onPressed: () {
                if (onpress == "widgetRumahsakit") {
                  setState(() {
                    widgetRumahsakit = !widgetRumahsakit;
                  });
                } else if (onpress == "widgetCallcentre") {
                  setState(() {
                    widgetCallcentre = !widgetCallcentre;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Container buildArrow(onpress) {
    Icon child;
    if (onpress == "widgetRumahsakit") {
      child = widgetRumahsakit
          ? Icon(Icons.arrow_drop_up, color: Colors.white, size: 30.0)
          : Icon(Icons.arrow_drop_down, color: Colors.white, size: 30.0);
    } else if (onpress == "widgetCallcentre") {
      child = widgetCallcentre
          ? Icon(Icons.arrow_drop_up, color: Colors.white, size: 30.0)
          : Icon(Icons.arrow_drop_down, color: Colors.white, size: 30.0);
    }
    return Container(
      height: 50.0,
      child: child,
    );
  }

  GestureDetector buildChildcard(String icon, title, subtitle, url) {
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
            children: <Widget>[
              Image.network(
                icon,
                height: 50.0,
                width: 50.0,
              ),
              SizedBox(width: 18.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: styleBold.copyWith(
                          fontSize: 16, color: Color(0xff353535)),
                    ),
                    Text(
                      subtitle,
                      style: styleMedium.copyWith(
                          fontSize: 12, color: Color(0xff353535)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => _launchInBrowser(url),
    );
  }

  GestureDetector buildChildcardphone(String icon, title, subtitle, phone) {
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
            children: <Widget>[
              Image.network(
                icon,
                height: 50.0,
                width: 50.0,
              ),
              SizedBox(width: 18.0),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: styleBold.copyWith(
                          fontSize: 16, color: Color(0xff353535)),
                    ),
                    Text(
                      subtitle,
                      style: styleMedium.copyWith(
                          fontSize: 12, color: Color(0xff353535)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => launch("tel:" + phone),
    );
  }

  Column buildRumahsakit() {
    return Column(
      children: <Widget>[
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/rsmy.png?alt=media&token=77f04843-e102-4504-870b-194a58b0270c",
          "RSUD M Yunus Bengkulu",
          "Telp (0736) 51111",
          "https://goo.gl/maps/XEMwnyzDafdrX3Vy8",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkuluutara.png?alt=media&token=1b97e69b-44ab-4de8-a4ae-26989f96bd74",
          "RSUD Argamakmur",
          "Telp (0737) 521118",
          "https://goo.gl/maps/ZErA9nFUyz9D89y59",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
            "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkuluselatan.png?alt=media&token=063737e7-469d-4668-8333-49a88006b47e",
            "RSUD Hasanuddin Damrah Manna",
            "Telp 085381637684",
            "https://goo.gl/maps/FL4AY6dK5KXzN3G26"),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/mukomuko.png?alt=media&token=9f6e4773-c2c7-4e75-af25-7c38892e628a",
          "RSUD Mukomuko",
          "Telp (0736) 52343466",
          "https://goo.gl/maps/ASxorB6QmjZkVx6J7",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/rscurup.png?alt=media&token=5e13eb4e-7a4a-405f-8794-6cf18f3eb1b4",
          "RSUD Curup",
          "Telp (0732) 21118",
          "https://goo.gl/maps/mjt9Zaxnuu6b7ms39",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/rsdkt.png?alt=media&token=2f0c7065-7415-4ce2-b9be-1e8f505dc612",
          "RS DKT Bengkulu",
          "Telp 081379452765",
          "https://goo.gl/maps/dJkiFN2kns4QXTZcA",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/rsbhayangkara.png?alt=media&token=9407773b-7f8f-4fa6-8985-d6c046a1cd42",
          "Rs Bhayangkara Jitra",
          "Telp (0736) 341086",
          "https://goo.gl/maps/RCduA6QiATFjLdPr7",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/rshd.png?alt=media&token=efc65871-5db8-47ee-9137-23bee2a3920b",
          "RSUD Harapan & Doa",
          "Telp 081379452765",
          "https://goo.gl/maps/WkNqfDj8QAUtPzDr8",
        ),
        SizedBox(height: 14.0),
      ],
    );
  }

  Column buildCallcenter() {
    return Column(
      children: <Widget>[
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/provbengkulu.png?alt=media&token=edfdfa42-887b-4180-a60f-cc0f943743c3",
          "Dinkes Prov Bengkulu",
          "Telp 085283798600",
          "085283798600",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkuluutara.png?alt=media&token=1b97e69b-44ab-4de8-a4ae-26989f96bd74",
          "Kab Bengkulu Utara",
          "Telp 085377998181",
          "085377998181",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
            "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkulu.png?alt=media&token=b70f3f7c-af62-4098-acfd-f1fea000cc69",
            "Kota Bengkulu",
            "Telp 08117105055",
            "08117105055"),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/kaur.png?alt=media&token=2630bbf3-527e-49ca-bf55-4f31ec14b536",
          "Kab Kaur",
          "Telp 085383237543",
          "085383237543",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/kephiang.png?alt=media&token=d25fbfd0-1ed5-4d30-a3de-ad5c8a444b69",
          "Kab Kepahiang",
          "Telp 085287277171",
          "085287277171",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/curup.png?alt=media&token=dcceb4fd-6316-449b-9f0f-65c582c982b9",
          "Kab Rejang Lebong",
          "Telp 085380316219",
          "085380316219",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkulutengah.png?alt=media&token=524a2d74-cf48-488a-b7ce-a01489814c63",
          "Kab Bengkulu Tengah",
          "Telp 082386650401",
          "082386650401",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/mukomuko.png?alt=media&token=9f6e4773-c2c7-4e75-af25-7c38892e628a",
          "Kab Muko-Muko",
          "Telp 082387882790",
          "082387882790",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/lebong.png?alt=media&token=086296ae-67cf-44b1-8f13-2425fda3ac09",
          "Kab Lebong",
          "Telp 082165032024",
          "082165032024",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/seluma.png?alt=media&token=32c96c30-be1b-4013-9e67-13bec3067a6b",
          "Kab Seluma",
          "Telp 082165032024",
          "082165032024",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "https://firebasestorage.googleapis.com/v0/b/betacov-adee6.appspot.com/o/bengkuluselatan.png?alt=media&token=063737e7-469d-4668-8333-49a88006b47e",
          "Kab Bengkulu Selatan",
          "Telp 085268913505",
          "085268913505",
        ),
        SizedBox(height: 14.0),
      ],
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
