import 'package:com.cardinalscout/src/models/category.dart';
import 'package:com.cardinalscout/src/models/activity.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/repository/category_repository.dart';
import 'package:com.cardinalscout/src/repository/activity_repository.dart';
import 'package:com.cardinalscout/src/repository/settings_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart'; 
import 'package:flutter/material.dart';


class CategoryController extends ControllerMVC {

  Category category;
  List<Activity> activitys = <Activity>[];

  GlobalKey<ScaffoldState> scaffoldKey;

  CategoryController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForCategory({String id, String message}) async {
    final Stream<Category> stream = await getCategory(id);
    stream.listen((Category _category) {
      setState(() => category = _category);
      print(category);
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
  
/*
  void listenForCategorys(String id) async {
    final Stream<Category> stream = await getCategorysOfUsers(id);
    stream.listen((Category _category) {
      setState(() => category.add(_category));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
*/
  
  Future<void> refreshCategory() async {
    var _id = category.id;
    category = new Category();
    activitys.clear();
    listenForCategory(id: _id, message: S.current.restaurant_refreshed_successfuly);
    //listenForActivitys(_id);
  }


}