import 'package:flutter/material.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/profile_controller.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import '../elements/PermissionDeniedWidget.dart';
import '../elements/ProfileAvatarWidget.dart';
import '../repository/user_repository.dart';

class ProfileWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  ProfileWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends StateMVC<ProfileWidget> {
  ProfileController _con;

  _ProfileWidgetState() : super(ProfileController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        centerTitle: true,
        title: Text(''
        /*   S.of(context).profile,
          style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3, color: Theme.of(context).primaryColor)), */
        ),
        actions: <Widget>[
        ],
      ),
      key: _con.scaffoldKey,
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : SingleChildScrollView(
//              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Column(
                children: <Widget>[
                  ProfileAvatarWidget(user: currentUser.value),
                   
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).hintColor,
                    ),
                    title: Text('Sobre mi'
                      /* S.of(context).about,
                      style: Theme.of(context).textTheme.display1, */
                    ),
                    
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      currentUser.value?.bio ?? "",
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                   ListTile(
                    /* contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Icon(
                      Icons.shopping_basket,
                      color: Theme.of(context).hintColor,
                    ), */
                    
                    title:  Text('Hola, tengo 11 años soy el guia de la patrulla Zorros,me encargo de que tengamos un buien ambiente en la patrulla, de ser siempre los mejores en las actividades, de ser los mas organizadas con nuestro uniforme y elementos misticos, y de siempre aprender cosas nuevas de nuestros jefes y cada una de las actividades'),/* Text(
                      S.of(context).recent_orders,
                      style: Theme.of(context).textTheme.display1,
                    ),  */
                  ),
                  
                ],
              ),
            ),
    );
  }
}
