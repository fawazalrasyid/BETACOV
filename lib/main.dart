import 'package:betacov/components/SplashScreen.dart';
import 'package:betacov/providers/BengkuluProvider.dart';
import 'package:betacov/providers/IndonesiaProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BengkuluProvider()),
        ChangeNotifierProvider(create: (_) => IndonesiaProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BETACOV',
        home: SplashScreen(),
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          accentColor: Color(0xffB51F89),
          primaryColor: Color(0xff7829B0),
          primaryColorDark: Color(0xff3215A4),
        ),
      ),
    );
  }
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.transparent, // status bar color
//   ));
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//   ]).then((_) {
//     runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'BETACOV',
//       home: SplashScreen(),
//       theme: ThemeData(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         accentColor: Color(0xffB51F89),
//         primaryColor: Color(0xff7829B0),
//         primaryColorDark: Color(0xff3215A4),
//       ),
//     ));
//   });
// }
