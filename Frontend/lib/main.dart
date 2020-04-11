import 'package:flutter/material.dart';

import 'package:cardinal_scout_app/src/pages/home_page.dart';


 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cardinal Scout',
     initialRoute: '/',
     routes: {
       '/': (BuildContext contex) => HomePage(),
     },
    );
  }
}