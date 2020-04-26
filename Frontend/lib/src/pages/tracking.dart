import 'package:flutter/material.dart';
import 'package:cardinalscout/generated/i18n.dart';
import 'package:cardinalscout/src/controllers/tracking_controller.dart';
import 'package:cardinalscout/src/helpers/helper.dart';
import 'package:cardinalscout/src/models/route_argument.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TrackingWidget extends StatefulWidget {
  RouteArgument routeArgument;

  TrackingWidget({Key key, this.routeArgument}) : super(key: key);

  @override
  _TrackingWidgetState createState() => _TrackingWidgetState();
}

class _TrackingWidgetState extends StateMVC<TrackingWidget> {
  TrackingController _con;

  _TrackingWidgetState() : super(TrackingController()) {
    _con = controller;
  }

  @override
  void initState() {
    //_con.listenForOrder(orderId: widget.routeArgument.id);
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
    final theme =
        Theme.of(context).copyWith(dividerColor: Colors.transparent, accentColor: Theme.of(context).accentColor);
    return Scaffold(
        key: _con.scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).tracking_order,
            style: Theme.of(context).textTheme.title.merge(TextStyle(letterSpacing: 1.3)),
          ),
          actions: <Widget>[
           
          ],
        ),
        body: _con.order == null || _con.orderStatus.isEmpty
            ? CircularLoadingWidget(height: 300)
            : Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 115),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Theme(
                            data: theme,
                            child: ExpansionTile(
                              initiallyExpanded: true,
                              title: Row(
                                children: <Widget>[
                                  Expanded(child: Text('${S.of(context).order_id}: #${_con.order.id}')),
                                  Text(
                                    '${_con.order.orderStatus.status}',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              children: List.generate(_con.order.foodOrders.length, (indexFood) {
                                return OrderItemWidget(
                                    heroTag: 'tracking_orders',
                                    order: _con.order,
                                    foodOrder: _con.order.foodOrders.elementAt(indexFood));
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Theme(
                              data: ThemeData(
                                primaryColor: Theme.of(context).accentColor,
                              ),
                              child: Stepper(
                                physics: ClampingScrollPhysics(),
                                controlsBuilder: (BuildContext context,
                                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                                  return SizedBox(height: 0);
                                },
                                steps: _con.getTrackingSteps(context),
                                currentStep: int.tryParse(this._con.order.orderStatus.id) - 1,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      color: Theme.of(context).brightness == Brightness.light
                                          ? Colors.black38
                                          : Theme.of(context).backgroundColor),
                                  child: Icon(
                                    Icons.place,
                                    color: Theme.of(context).primaryColor,
                                    size: 38,
                                  ),
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _con.order.deliveryAddress?.description ?? "",
                                            overflow: TextOverflow.fade,
                                            softWrap: false,
                                            style: Theme.of(context).textTheme.subhead,
                                          ),
                                          Text(
                                            _con.order.deliveryAddress?.address ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: Theme.of(context).textTheme.caption,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 135,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context).focusColor.withOpacity(0.15),
                                offset: Offset(0, -2),
                                blurRadius: 5.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text("How would you rate this restaurant ?", style: Theme.of(context).textTheme.subhead),
                          Text("Click on the stars below to leave comments",
                              style: Theme.of(context).textTheme.caption),
                          SizedBox(height: 5),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/Reviews',
                                  arguments: RouteArgument(id: _con.order.id, heroTag: "restaurant_reviews"));
                            },
                            padding: EdgeInsets.symmetric(vertical: 5),
                            shape: StadiumBorder(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: Helper.getStarsList(double.parse(_con.order.foodOrders[0].food.restaurant.rate),
                                  size: 35),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ));*/
  }
}