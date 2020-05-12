import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/controllers/activity_controller.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/route_argument.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class ActivityWidget extends StatefulWidget {

  RouteArgument routeArgument;

  ActivityWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _ActivityWidgetState createState() {
    return _ActivityWidgetState();
  }
}

class _ActivityWidgetState extends StateMVC<ActivityWidget> {
  ActivityController _con;

  _ActivityWidgetState() : super(ActivityController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForActivity(id: widget.routeArgument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _con.scaffoldKey,
        //floatingActionButton: FloatingActionButton.extended(
          //onPressed: () {
            //Navigator.of(context).pushNamed('/Menu', arguments: new RouteArgument(id: widget.routeArgument.id));
         //},
          //isExtended: true,
          //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //icon: Icon(Icons.restaurant),
         // label: Text(S.of(context).menu),
        //),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: RefreshIndicator(
          onRefresh: _con.refreshActivity,
          child: _con.activity == null
              ? CircularLoadingWidget(height: 500)
              : Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    CustomScrollView(
                      primary: true,
                      shrinkWrap: false,
                      slivers: <Widget>[                        
                        SliverAppBar(
                          backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
                          expandedHeight: 300,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
                          flexibleSpace: FlexibleSpaceBar(
                            collapseMode: CollapseMode.parallax,
                            background: Hero(
                              tag: widget.routeArgument.heroTag + _con.activity.id,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: 'https://image.freepik.com/vector-gratis/camping-aventura-bosque-paisaje-nocturno_18591-52021.jpg',
                                placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 25),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    Expanded(
                                      child: Text(
                                        _con.activity.name,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.display2,
                                        
                                        
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              //Tipo Subtitulo

                              /* Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Html(
                                  data: _con.activity.name,
                                  defaultTextStyle: Theme.of(context).textTheme.body1.merge(TextStyle(fontSize: 14)),
                                ),
                              ), */
                              
                              //ImageThumbCarouselWidget(galleriesList: _con.galleries),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                                  leading: Icon(
                                    Icons.stars,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  title: Text(
                                    S.of(context).information,
                                    style: Theme.of(context).textTheme.display1,
                                  ),
                                ),
                              ),
                             
                             //Conteiner Descripcion 

                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: Theme.of(context).primaryColor,
                                child: Helper.applyHtml(context, _con.activity.description),
                                
                                
                              ),

        RaisedButton(
          
          onPressed: () {},
          textColor: Colors.white,
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFF00C9DE),
                  Color(0xFF00C9DE),
                  Color(0xFF42A5F5),
                ],
              ),
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Solicitar',
              style: TextStyle(fontSize: 20)
            ),
          ),
        ),

                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ));
  }
}
