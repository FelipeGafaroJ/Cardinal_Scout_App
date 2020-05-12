import 'package:flutter/material.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import 'package:com.cardinalscout/src/models/block.dart';
import 'package:com.cardinalscout/src/models/route_argument.dart';

import 'BlockWidget.dart';

class BlocksCarouselWidget extends StatefulWidget {
  
  List<Block> blocksList;
  String heroTag;

  BlocksCarouselWidget({Key key, this.blocksList, this.heroTag}) : super(key: key);

  @override
    _BlocksCarouselWidgetState createState() => _BlocksCarouselWidgetState();
  }

class _BlocksCarouselWidgetState extends State<BlocksCarouselWidget> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.blocksList.isEmpty
        ? CircularLoadingWidget(height: 288)
        : Container(
            height: 350, //Tamaño contenedor 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.blocksList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Blocks',
                        arguments: RouteArgument(
                          id: widget.blocksList.elementAt(index).id,
                          heroTag: widget.heroTag+ widget.blocksList.elementAt(index).id,
                        ));
                  },
                  child: BlockWidget(block: widget.blocksList.elementAt(index), heroTag: widget.heroTag),
                );
              },
            ),
          );
  }
}
