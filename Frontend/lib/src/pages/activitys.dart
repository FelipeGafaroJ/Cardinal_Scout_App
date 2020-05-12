import 'package:flutter/material.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../controllers/activity_controller.dart';
import '../elements/CircularLoadingWidget.dart';
import '../elements/ActivityItemWidget.dart';
import '../elements/PermissionDeniedWidget.dart';
import '../repository/user_repository.dart';
import '../repository/activity_repository.dart';

class ActivitysWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  ActivitysWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _ActivitysWidgetState createState() => _ActivitysWidgetState();
}

class _ActivitysWidgetState extends StateMVC<ActivitysWidget> {

  ActivityController _con;

  _ActivitysWidgetState() : super(ActivityController()) {
    _con = controller;
  }
  
  @override
  void initState() {
    _con.listenForActivitysUser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.transparent,
        backgroundColor:Color(0xFF3EBACE) ,
        elevation: 0,
        centerTitle: true,
        
        title: Text(
          'Mis Actividades',
          style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3,color: Colors.white)),
        ),
        actions: <Widget>[
        ],
      ),
      body: currentUser.value.apiToken == null
          ? PermissionDeniedWidget()
          : RefreshIndicator(
              onRefresh: _con.refreshActivitys,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //Padding(
                     // padding: const EdgeInsets.symmetric(horizontal: 20),
                      //child: SearchBarWidget(),
                    //),
                    SizedBox(height: 10),
                    _con.activitys.isEmpty
                        ? CircularLoadingWidget(height: 500)
                        : ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: _con.activitys.length,
                            itemBuilder: (context, index) {
                              return Theme(
                                data: theme,
                                child: ExpansionTile(
                                  initiallyExpanded: true,
                                  title: Row(
                                    children: <Widget>[
                                      Expanded(child: Text('ACTIVIDAD: #${_con.activitys.elementAt(index).id}')),                                      
                                      Text(
                                        _con.activitys.elementAt(index).indicted,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  children: <Widget>[
                                        // Mapa de iconos

                                        /*  Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: _icons
                                              .asMap()
                                              .entries
                                              .map(
                                                (MapEntry map) => _buildIcon(map.key),
                                              )
                                              .toList(),
                                        ),
                                        // Cierra Mapa inconos */
                                        
                                        ActivityItemWidget(activity: _con.activitys.elementAt(index), heroTag: 'activitys_list_block'),

                                      ],
                                   
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
