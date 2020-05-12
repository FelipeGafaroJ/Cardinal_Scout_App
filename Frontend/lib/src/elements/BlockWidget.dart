//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:com.cardinalscout/src/models/block.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:com.cardinalscout/src/models/route_argument.dart';

class BlockWidget extends StatelessWidget {

  Block block;
  String heroTag;

  BlockWidget({Key key, this.block, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292,
      margin: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 15, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Image of the card
          Hero(
            tag: this.heroTag + block.id,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                height: 150,
                fit: BoxFit.cover,
                imageUrl: 'https://3.bp.blogspot.com/-kkeYcP_AEwQ/Wu3KCtVcapI/AAAAAAAAC0E/wqhezwII_zwwMQfgHcULC905d8g3DFuxACLcBGAs/s1600/Vig%25C3%25ADa.png',
                placeholder: (context, url) => Image.asset(
                  'assets/img/loading.gif',
                  fit: BoxFit.cover,
                  height: 150,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        block.name,
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        Helper.skipHtml(block.description),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      SizedBox(height: 20),                      
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
