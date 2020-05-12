import 'package:com.cardinalscout/src/models/block.dart';
import 'package:com.cardinalscout/src/models/activity.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/repository/block_repository.dart';
import 'package:com.cardinalscout/src/repository/activity_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart'; 
import 'package:flutter/material.dart';


class CompassWidget extends ControllerMVC {

  GlobalKey<ScaffoldState> scaffoldKey;

  CompassWidget() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

}