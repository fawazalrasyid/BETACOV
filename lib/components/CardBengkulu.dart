import 'package:betacov/utils/Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:intl/intl.dart';

class CardBengkulu extends StatelessWidget {
  final confirmed;
  final recovered;
  final deaths;
  final odp;
  final pdp;
  final lastupdate;

  CardBengkulu(
      {this.confirmed,
      this.deaths,
      this.recovered,
      this.odp,
      this.pdp,
      this.lastupdate});

  final DateFormat dayFormat = DateFormat("d MMM yyyy HH:mm:ss");

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
                SizedBox(height: 16.0),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 13 / 8,
                  children: <Widget>[
                    buildCardContainer(
                      "ODP",
                      odp.toString(),
                      0xffC37FFF,
                    ),
                    buildCardContainer(
                      "PDP",
                      pdp.toString(),
                      0Xff6CB0FF,
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
                "Update Kasus Bengkulu",
                style:
                    styleBold.copyWith(fontSize: 16, color: Color(0xff353535)),
              ),
              Text(
                dayFormat.format(lastupdate),
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
            onPressed: () =>
                _launchURL(context, "https://covid19.bengkuluprov.go.id/"),
          ),
        ],
      ),
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

  Container buildCardContainer(String title, data, color) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffFFFFFFF),
        border: Border.all(
          width: 1.5,
          color: Color(0xffE1E1E1),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
      ),
    );
  }
}
