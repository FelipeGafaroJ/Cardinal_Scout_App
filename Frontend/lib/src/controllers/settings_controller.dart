import 'package:flutter/material.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/models/user.dart';
import 'package:com.cardinalscout/src/repository/user_repository.dart' as repository;
import 'package:mvc_pattern/mvc_pattern.dart';

class SettingsController extends ControllerMVC {
  
  GlobalKey<FormState> loginFormKey;
  GlobalKey<ScaffoldState> scaffoldKey;

  SettingsController() {
    loginFormKey = new GlobalKey<FormState>();
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void update(User user) async {
    repository.update(user).then((value) {
      setState(() {
        //this.favorite = value;
      });
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(S.current.profile_settings_updated_successfully),
      ));
    });
  }

  void listenForUser() async {
    setState(() {});
  }

  Future<void> refreshSettings() async {
  }
}
