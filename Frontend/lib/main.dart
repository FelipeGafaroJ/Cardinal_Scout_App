import 'package:flutter/material.dart';

//import 'package:cardinal_scout_app/src/pages/home_page.dart';
import 'package:cardinal_scout_app/src/pages/screens/home_screen.dart';


 
void main() => runApp(MyApp());
 
/* class MyApp extends StatelessWidget {
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
} */

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardinal Scout',
      debugShowCheckedModeBanner: false,
       initialRoute: '/',
     routes: {
       '/': (BuildContext contex) => HomeScreen(),
     },
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Color(0xFFD8ECF1),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        
      ),
      //home: HomeScreen(),
    );
  }
}
