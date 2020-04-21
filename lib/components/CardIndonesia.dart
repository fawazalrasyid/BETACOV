import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class CardIndonesia extends StatelessWidget {
  final TextStyle styleBold = TextStyle(fontFamily: 'PoppinsBold');
  final TextStyle styleMedium = TextStyle(fontFamily: 'PoppinsMedium');
  final TextStyle styleRegular = TextStyle(fontFamily: 'PoppinsRegular');

  final confirmed;
  final recovered;
  final deaths;
  final lastupdate;

  CardIndonesia({this.confirmed, this.deaths, this.recovered, this.lastupdate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildUpdate(context),
        SizedBox(height: 16.0),
        Container(
          width: MediaQuery.of(context).size.width,
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 17 / 20,
                  children: <Widget>[
                    buildCard(
                      "Kasus Positif",
                      confirmed.toString(),
                      "assets/images/positif.png",
                      0XffF5A623,
                    ),
                    buildCard(
                      "Sembuh",
                      recovered.toString(),
                      "assets/images/sembuh.png",
                      0Xff6CCE00,
                    ),
                    buildCard(
                      "Meninggal",
                      deaths.toString(),
                      "assets/images/meninggal.png",
                      0XffD0021B,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column buildCard(String title, data, icon, color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(icon, height: 28.0),
        SizedBox(height: 8.0),
        Text(
          data,
          textAlign: TextAlign.center,
          style: styleBold.copyWith(
            fontSize: 32.0,
            color: Color(color),
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: styleMedium.copyWith(
            fontSize: 13.0,
            color: Color(color),
          ),
        )
      ],
    );
  }

  Future<void> _launchURL(BuildContext context, String url) async {
    try {
      await launch(
        url,
        option: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColorDark,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Container buildUpdate(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Update Kasus Nasional",
                style:
                    styleBold.copyWith(fontSize: 16, color: Color(0xff353535)),
              ),
              Text(
                lastupdate.toString(),
                style:
                    styleBold.copyWith(fontSize: 12, color: Color(0xFF8E8E8E)),
              )
            ],
          ),
          RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xFFF9E1FF))),
            color: Color(0xFFFFFFFF),
            textColor: Colors.white,
            child: Text(
              "Lihat Detail",
              style: styleBold.copyWith(fontSize: 12, color: Color(0xFFC063D7)),
            ),
            onPressed: () => _launchURL(context,
                "https://experience.arcgis.com/experience/57237ebe9c5b4b1caa1b93e79c920338"),
          ),
        ],
      ),
    );
  }
}
