import 'package:betacov/components/Header.dart';
import 'package:flutter/material.dart';

class Informasi extends StatefulWidget {
  @override
  _InformasiState createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  bool widgetCardCovid = false;
  bool widgetCardCegah = false;
  bool widgetCardKenali = false;

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
                image: "assets/images/bg-ornament-informasi.png",
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  children: <Widget>[
                    buildTitle("assets/images/virus.png", "Apa itu COVID-19?",
                        "widgetCardCovid"),
                    SizedBox(height: 14.0),
                    //buildCardCovid(),
                    Container(
                      child: widgetCardCovid ? buildCardCovid() : null,
                    ),
                    SizedBox(height: 14.0),
                    buildTitle("assets/images/mencegah.png", "Cara Mencegah",
                        "widgetCardCegah"),
                    SizedBox(height: 14.0),
                    Container(
                      child: widgetCardCegah ? buildColumnCegah() : null,
                    ),
                    SizedBox(height: 14.0),
                    buildTitle("assets/images/mengenal.png", "Cara Mengenali",
                        "widgetCardKenali"),
                    SizedBox(height: 14.0),
                    Container(
                      child: widgetCardKenali ? buildColumnKenali() : null,
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

  Container buildTitle(String icon, title, onpress) {
    String onn = onpress;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(icon, height: 50.0),
              SizedBox(width: 14.0),
              Text(
                title,
                style:
                    styleBold.copyWith(fontSize: 16, color: Color(0xff353535)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (onpress == "widgetCardCovid") {
                setState(() {
                  widgetCardCovid = !widgetCardCovid;
                });
              } else if (onpress == "widgetCardCegah") {
                setState(() {
                  widgetCardCegah = !widgetCardCegah;
                });
              } else if (onpress == "widgetCardKenali") {
                setState(() {
                  widgetCardKenali = !widgetCardKenali;
                });
              }
            },
            child: buildArrow(onn),
          ),
        ],
      ),
    );
  }

  Container buildArrow(onpress) {
    Icon child;
    if (onpress == "widgetCardCovid") {
      child = widgetCardCovid
          ? Icon(Icons.arrow_drop_up, color: Colors.black, size: 30.0)
          : Icon(Icons.arrow_drop_down, color: Colors.black, size: 30.0);
    } else if (onpress == "widgetCardCegah") {
      child = widgetCardCegah
          ? Icon(Icons.arrow_drop_up, color: Colors.black, size: 30.0)
          : Icon(Icons.arrow_drop_down, color: Colors.black, size: 30.0);
    } else if (onpress == "widgetCardKenali") {
      child = widgetCardKenali
          ? Icon(Icons.arrow_drop_up, color: Colors.black, size: 30.0)
          : Icon(Icons.arrow_drop_down, color: Colors.black, size: 30.0);
    }
    return Container(
      height: 50.0,
      child: child,
    );
  }

  Column buildColumnCegah() {
    return Column(
      children: <Widget>[
        buildCard(
          "assets/ilustrasi/handwash.png",
          "Cuci Tangan",
          "Cuci tangan dengan sabun, setidaknya selama 20 detik.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/usemask.png",
          "Gunakan Masker",
          "Penggunaan masker dapat meminimalisir penularan virus corona.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/etikabersin.png",
          "Etika Bersin dan Batuk",
          "Terapkan etika bersin dan batuk dengan benar menggunakan siku tangan bagian dalam atau tisu bersih.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/donttouchface.png",
          "Hindari Sentuh Wajah",
          "Virus corona disinyalir dapat masuk tubuh manusia melalui segitiga wajah yakni mata, hidung, dan mulut.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/physicaldistancing.png",
          "Physical Distancing",
          "Menjaga jarak antara satu sama lain dapat mengurangi risiko penyebaran virus corona.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/stayathome.png",
          "Dirumah Aja",
          "Tetap dirumah kalau tidak ada urusan penting, untuk memutus rantai penyebaran COVID-19",
        ),
      ],
    );
  }

  Column buildColumnKenali() {
    return Column(
      children: <Widget>[
        buildCard(
          "assets/ilustrasi/letih.png",
          "Letih, Lesu",
          "Orang yang mengalami kelelahan ekstrem bisa menjadi tanda awal virus corona.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/demam.png",
          "Demam",
          "Satu di antara gejala terinfeksi virus corona yang akan muncul adalah demam tinggi, mirip demam saat terkena flu.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/batuk.png",
          "Batuk, Pilek",
          "Batuk merupakan gejala umum dari infeksi virus corona. Akan tetapi, batuk yang muncul bukan batuk biasa.",
        ),
        SizedBox(height: 8.0),
        buildCard(
          "assets/ilustrasi/gangguanpernapasan.png",
          "Gangguan Pernapasan",
          "Selain batuk parah yang dialami, akibat lain dari virus yang menyerang sistem pernapasan ini adalah sesak napas. Hal tersebut terjadi setelah mengalami gejala batuk yang cukup parah. Ini pertanda paru-paru Anda sedang diserang oleh virus.",
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Container buildCard(String icon, title, subtitle) {
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
        child: Row(
          children: <Widget>[
            Image.asset(icon, height: 70.0),
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
    );
  }

  Container buildCardCovid() {
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
                Image.asset("assets/ilustrasi/coronavirus.png", height: 70.0),
                SizedBox(width: 18.0),
                Text(
                  "Coronavirus Disease",
                  style: styleBold.copyWith(
                      fontSize: 16, color: Color(0xff353535)),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "COVID-19 adalah penyakit menular yang disebabkan oleh jenis coronavirus yang baru ditemukan (SARS-CoV-2). Ini merupakan virus baru dan penyakit yang sebelumnya tidak dikenal sebelum terjadi wabah di Wuhan, Tiongkok, bulan Desember 2019.",
              style:
                  styleMedium.copyWith(fontSize: 12, color: Color(0xff353535)),
            ),
          ],
        ),
      ),
    );
  }
}
