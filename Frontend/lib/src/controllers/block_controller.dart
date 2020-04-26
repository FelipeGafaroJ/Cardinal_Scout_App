import 'package:cardinalscout/src/models/block.dart';
import 'package:cardinalscout/src/models/activity.dart';
import 'package:cardinalscout/generated/i18n.dart';
import 'package:cardinalscout/src/repository/block_repository.dart';
import 'package:cardinalscout/src/repository/activity_repository.dart';
import 'package:cardinalscout/src/repository/settings_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart'; 
import 'package:flutter/material.dart';


class BlockController extends ControllerMVC {

  Block block;
  List<Activity> activitys = <Activity>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  BlockController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForBlock({String id, String message}) async {
    final Stream<Block> stream = await getBlock(id);
    stream.listen((Block _block) {
      setState(() => block = _block);
      print(block);
    }, onError: (a) {
      print(a);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(S.current.verify_your_internet_connection),
      ));
    }, onDone: () {
      if (message != null) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  void listenForActivitys(String id) async {
    final Stream<Activity> stream = await getActivitysOfBlock(id);
    stream.listen((Activity _activity) {
      setState(() => activitys.add(_activity));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }

  
  Future<void> refreshBlock() async {
    var _id = block.id;
    block = new Block();
    activitys.clear();
    listenForBlock(id: _id, message: S.current.restaurant_refreshed_successfuly);
    listenForActivitys(_id);
  }


}