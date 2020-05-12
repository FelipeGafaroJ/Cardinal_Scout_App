import 'package:com.cardinalscout/src/models/activity.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/repository/activity_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart'; 
import 'package:flutter/material.dart';


class ActivityController extends ControllerMVC {

  Activity activity;
  List<Activity> activitys = <Activity>[];
  GlobalKey<ScaffoldState> scaffoldKey;

  ActivityController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForActivity({String id, String message}) async {

    final Stream<Activity> stream = await getActivity(id);
    stream.listen((Activity _activity) {
      setState(() => activity = _activity);
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
  
  
  void listenForActivitysUser() async {

    final Stream<Activity> stream = await getActivitysOfUser();
    
    stream.listen((Activity _activity) {
      setState(() => activitys.add(_activity));
    }, onError: (a) {
      print(a);
    }, onDone: () {});


  }
  

  Future<void> refreshActivity() async {
    var _id = activity.id;
    activity = new Activity();
    listenForActivity(id: _id, message: S.current.activity_refreshed_successfuly);
    
  }

  
  Future<void> refreshActivitys() async {
    activitys = <Activity>[];
    listenForActivitysUser();    
  }


}