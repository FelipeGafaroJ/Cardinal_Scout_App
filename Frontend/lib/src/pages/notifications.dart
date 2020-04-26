import 'package:flutter/material.dart';
import 'package:cardinalscout/generated/i18n.dart';
import 'package:cardinalscout/src/controllers/notification_controller.dart';
import 'package:cardinalscout/src/elements/EmptyNotificationsWidget.dart';
import 'package:cardinalscout/src/elements/NotificationItemWidget.dart';
import 'package:cardinalscout/src/elements/PermissionDeniedWidget.dart';
import 'package:cardinalscout/src/repository/user_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class NotificationsWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  NotificationsWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends StateMVC<NotificationsWidget> {
  NotificationController _con;

  _NotificationsWidgetState() : super(NotificationController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        //leading: new IconButton(
          //icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          //onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        //),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).notifications,
          style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3)),
        ),
        actions: <Widget>[
          
        ],
      ),
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : RefreshIndicator(
              onRefresh: _con.refreshNotifications,
              child: _con.notifications.isEmpty
                  ? EmptyNotificationsWidget()
                  : SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              leading: Icon(
                                Icons.notifications,
                                color: Theme.of(context).hintColor,
                              ),
                              title: Text(
                                S.of(context).notifications,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.display1,
                              ),
                            ),
                          ),
                          ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: _con.notifications.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15);
                            },
                            itemBuilder: (context, index) {
                              return NotificationItemWidget(notification: _con.notifications.elementAt(index));
                            },
                          ),
                        ],
                      ),
                    ),
            ),
    );
  }
}
