import 'package:betacov/components/Header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bantuan extends StatefulWidget {
  @override
  _BantuanState createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

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
            GestureDetector(
              onTap: () {
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
              child: buildArrow(onn),
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
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rsmy.png",
          "RSUD M Yunus Bengkulu",
          "Telp (0736) 51111",
          "https://goo.gl/maps/XEMwnyzDafdrX3Vy8",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/bengkuluutara.png",
          "RSUD Argamakmur",
          "Telp (0737) 521118",
          "https://goo.gl/maps/ZErA9nFUyz9D89y59",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
            "http://bengkulutanggapcovid.000webhostapp.com/assets/bengkuluselatan.png",
            "RSUD Hasanuddin Damrah Manna",
            "Telp 085381637684",
            "https://goo.gl/maps/FL4AY6dK5KXzN3G26"),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/mukomuko.png",
          "RSUD Mukomuko",
          "Telp (0736) 52343466",
          "https://goo.gl/maps/ASxorB6QmjZkVx6J7",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rscurup.png",
          "RSUD Curup",
          "Telp (0732) 21118",
          "https://goo.gl/maps/mjt9Zaxnuu6b7ms39",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rsdkt.png",
          "RS DKT Bengkulu",
          "Telp 081379452765",
          "https://goo.gl/maps/dJkiFN2kns4QXTZcA",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rsbhayangkara.png",
          "Rs Bhayangkara Jitra",
          "Telp (0736) 341086",
          "https://goo.gl/maps/RCduA6QiATFjLdPr7",
        ),
        SizedBox(height: 8.0),
        buildChildcard(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rshd.png",
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
          "http://bengkulutanggapcovid.000webhostapp.com/assets/bengkuluprov.png",
          "Dinkes Prov Bengkulu",
          "Telp 085283798600",
          "085283798600",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/bengkuluutara.png",
          "Kab Bengkulu Utara",
          "Telp 085377998181",
          "085377998181",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
            "http://bengkulutanggapcovid.000webhostapp.com/assets/bengkulu.png",
            "Kota Bengkulu",
            "Telp 08117105055",
            "08117105055"),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/kaur.png",
          "Kab Kaur",
          "Telp 085383237543",
          "085383237543",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/kepahiang.png",
          "Kab Kepahiang",
          "Telp 085287277171",
          "085287277171",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/curup.png",
          "Kab Rejang Lebong",
          "Telp 085380316219",
          "085380316219",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/rsbhayangkara.png",
          "Kab Bengkulu Tengah",
          "Telp 082386650401",
          "082386650401",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/mukomuko.png",
          "Kab Muko-Muko",
          "Telp 082387882790",
          "082387882790",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/lebong.png",
          "Kab Lebong",
          "Telp 082165032024",
          "082165032024",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/seluma.png",
          "Kab Seluma",
          "Telp 082165032024",
          "082165032024",
        ),
        SizedBox(height: 8.0),
        buildChildcardphone(
          "http://bengkulutanggapcovid.000webhostapp.com/assets/mbengkuluselatan.png",
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
