import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/controllers/block_controller.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import 'package:com.cardinalscout/src/elements/ActivityItemWidget.dart';
import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/route_argument.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BlockWidget extends StatefulWidget {

  RouteArgument routeArgument;

  BlockWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _BlockWidgetState createState() {
    return _BlockWidgetState();
  }
}

class _BlockWidgetState extends StateMVC<BlockWidget> {
  BlockController _con;

  _BlockWidgetState() : super(BlockController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForBlock(id: widget.routeArgument.id);
    _con.listenForActivitys(widget.routeArgument.id);
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
          onRefresh: _con.refreshBlock,
          child: _con.block == null
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
                              tag: widget.routeArgument.heroTag + _con.block.id,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: 'https://3.bp.blogspot.com/-kkeYcP_AEwQ/Wu3KCtVcapI/AAAAAAAAC0E/wqhezwII_zwwMQfgHcULC905d8g3DFuxACLcBGAs/s1600/Vig%25C3%25ADa.png',
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
                                        _con.block.name,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.display2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                child: Html(
                                  data: _con.block.name,
                                  defaultTextStyle: Theme.of(context).textTheme.body1.merge(TextStyle(fontSize: 14)),
                                ),
                              ),
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
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                color: Theme.of(context).primaryColor,
                                child: Helper.applyHtml(context, _con.block.name),
                              ),
                              _con.activitys.isEmpty
                                  ? SizedBox(height: 0)
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                                        leading: Icon(
                                          Icons.ac_unit,
                                          color: Theme.of(context).hintColor,
                                        ),
                                        title: Text(
                                          //S.of(context).featured_foods,
                                          'Listado de Actividades',
                                          style: Theme.of(context).textTheme.display1,
                                        ),
                                      ),
                                    ),
                              _con.activitys.isEmpty
                                  ? SizedBox(height: 0)
                                  : ListView.separated(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount: _con.activitys.length,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(height: 10);
                                      },
                                      itemBuilder: (context, index) {
                                        return ActivityItemWidget(
                                          heroTag: 'activitys_list_block',
                                          activity: _con.activitys.elementAt(index),
                                        );
                                      },
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
