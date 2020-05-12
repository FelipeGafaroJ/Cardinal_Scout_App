
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/controllers/controller.dart';
import 'package:com.cardinalscout/src/repository/user_repository.dart' as userRepo;
import 'package:mvc_pattern/mvc_pattern.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends StateMVC<SplashScreen> {
  Controller _con;

  SplashScreenState() : super(Controller()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      print(userRepo.currentUser.value.apiToken);
      if (userRepo.currentUser.value.apiToken == null) {
        Navigator.of(context).pushReplacementNamed('/Login');
      } else {
        Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.explore,
                size: 90,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Text(
                S.of(context).cardinalscout,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .merge(TextStyle(color: Theme.of(context).scaffoldBackgroundColor)),
              ),
              SizedBox(height: 50),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).scaffoldBackgroundColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




