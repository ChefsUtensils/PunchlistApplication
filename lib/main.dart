import 'package:flutter/material.dart';
import 'package:punchlist/SubcontractorPage/SpecificSubPage/SubDetailScreen.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'SubcontractorPage/SubcontractorPage.dart';
import 'SubcontractorPage/NewContractor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //final Color buttons = Color(0xffC38D9E);
  //final Color altAccent = Color(0xff41B3A3);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Color(0xFF77A6F7),
        primaryColor: Colors.cyan[600],
        accentColor: Color(0xffE8A87C),
        //buttonColor: buttons,
        fontFamily: ''
      ),
      routes: {
        '/': (context) => AuthPage(),
        '/home': (context) => HomePage(),
        '/subPage': (context) => SubPage(),
        '/newSubPage': (context) => NewSub(),
        '/subDetailScreen': (context) => SubDetailScreen(),
      },
    );
  }
}
