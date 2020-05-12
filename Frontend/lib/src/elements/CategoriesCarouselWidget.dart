import 'package:flutter/material.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import 'package:com.cardinalscout/src/models/category.dart';
import 'package:com.cardinalscout/src/models/route_argument.dart';

import 'CategorieWidget.dart';

class CategoriesCarouselWidget extends StatefulWidget {
  
  List<Category> categorysList;
  String heroTag;

  CategoriesCarouselWidget({Key key, this.categorysList, this.heroTag}) : super(key: key);

  @override
    _CategoriesCarouselWidgetState createState() => _CategoriesCarouselWidgetState();
  }

class _CategoriesCarouselWidgetState extends State<CategoriesCarouselWidget> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.categorysList.isEmpty
        ? CircularLoadingWidget(height: 288)
        : Container(
            height: 410,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categorysList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Categorys',
                        arguments: RouteArgument(
                          id: widget.categorysList.elementAt(index).id,
                          heroTag: widget.heroTag,
                        ));
                  },
                  child: CategorieWidget(category: widget.categorysList.elementAt(index), heroTag: widget.heroTag),
                );
              },
            ),
          );
  }
}
