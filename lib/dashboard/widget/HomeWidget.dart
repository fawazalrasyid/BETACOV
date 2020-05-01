import 'package:betacov/providers/BengkuluProvider.dart';
import 'package:betacov/providers/IndonesiaProvider.dart';
import 'package:betacov/components/CardBengkulu.dart';
import 'package:betacov/components/CardIndonesia.dart';
import 'package:betacov/components/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<BengkuluProvider>(context, listen: false).getBengkuluProvider();
    Provider.of<IndonesiaProvider>(context, listen: false)
        .getIndonesiaProvider();
  }

  @override
  Widget build(BuildContext context) {
    var bengkulu = Provider.of<BengkuluProvider>(context).bengkulu;
    var indonesia = Provider.of<IndonesiaProvider>(context).indonesia;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFF3215A4),
          elevation: 0.0,
        ),
      ),
      backgroundColor: Color(0xFFFEFEFE),
      body: RefreshIndicator(
        onRefresh: () => Future.wait([
          Provider.of<BengkuluProvider>(context, listen: false)
              .getBengkuluProvider(),
          Provider.of<IndonesiaProvider>(context, listen: false)
              .getIndonesiaProvider(),
        ]),
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: SafeArea(
                top: true,
                bottom: true,
                left: true,
                right: true,
                child: Column(
                  children: <Widget>[
                    Header(image: "assets/images/bg-ornament-home.png"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
                      child: FutureBuilder(
                        future: Future.wait([
                          Provider.of<BengkuluProvider>(context, listen: false)
                              .getBengkuluProvider(),
                          Provider.of<IndonesiaProvider>(context, listen: false)
                              .getIndonesiaProvider(),
                        ]),
                        builder: (context, snapshot) {
                          if (bengkulu != null && indonesia != null) {
                            return Column(
                              children: <Widget>[
                                CardBengkulu(
                                  confirmed: bengkulu.confirmed,
                                  recovered: bengkulu.recovered,
                                  deaths: bengkulu.deaths,
                                  odp: bengkulu.odp,
                                  pdp: bengkulu.pdp,
                                  lastupdate: bengkulu.lastupdate,
                                ),
                                SizedBox(height: 16.0),
                                CardIndonesia(
                                    confirmed: indonesia.confirmed,
                                    recovered: indonesia.recovered,
                                    deaths: indonesia.deaths,
                                    lastupdate: indonesia.lastupdate),
                                SizedBox(height: 16.0),
                              ],
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
