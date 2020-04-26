import 'package:flutter/material.dart';
//import 'package:cardinalscout/generated/i18n.dart';
import 'package:cardinalscout/src/controllers/home_controller.dart';
import 'package:cardinalscout/src/elements/BlocksCarouselWidget.dart';
//import 'package:cardinalscout/src/repository/settings_repository.dart' as settingsRepo;
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomeWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<HomeWidget> {

  HomeController _con;

  _HomeWidgetState() : super(HomeController()) {
    _con = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 5.0),         
          children: <Widget>[
            SizedBox(height: 20.0),
            BlocksCarouselWidget(blocksList: _con.blocks, heroTag: 'home_blocks'),
            

            SizedBox(height: 20.0),
          ],
        ),
      ),

    );
  }
}




