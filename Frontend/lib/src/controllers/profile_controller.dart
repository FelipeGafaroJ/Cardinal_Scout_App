import 'package:flutter/material.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class ProfileController extends ControllerMVC {
  
  //List<Order> recentOrders = [];
  GlobalKey<ScaffoldState> scaffoldKey;

  ProfileController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    //listenForRecentOrders();
  }


}
