
import 'package:flutter/material.dart';
//import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/controllers/home_controller.dart';
import 'package:com.cardinalscout/src/elements/BlocksCarouselWidget.dart';
import 'package:com.cardinalscout/src/elements/CategoriesCarouselWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:com.cardinalscout/src/repository/settings_repository.dart' as settingsRepo;
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeWidget extends StatefulWidget {

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  HomeWidget({Key key, this.parentScaffoldKey}) : super(key: key);
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends StateMVC<HomeWidget> {

  HomeController _con;

  _HomeWidgetState() : super(HomeController()) {
    _con = controller;
  }


    int _selectedIndex = 0;
  int _currentTab = 0;
  
  List<IconData> _icons = [
    FontAwesomeIcons.percentage,
    FontAwesomeIcons.bahai,
    FontAwesomeIcons.dragon,
    FontAwesomeIcons.compass,
    
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor:Color(0xFF3EBACE) ,
          leading: Container(
          padding: EdgeInsets.all(7),           
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
               /*  Icon(Icons.more_vert,
                color: Colors.white,
                size: 24.0,

              ), */
              
              Image.network('https://i.ibb.co/wBNytqK/Logo-Prueba.png', height: 30,),
             // imageUrl: 'https://3.bp.blogspot.com/-kkeYcP_AEwQ/Wu3KCtVcapI/AAAAAAAAC0E/wqhezwII_zwwMQfgHcULC905d8g3DFuxACLcBGAs/s1600/Vig%25C3%25ADa.png',
              //Image.asset("assets/img/LogoPrueba.png", height: 10,),
              Text(" Cardinal Scout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              
              
            ],
          ),                                                  

            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                /* child: Icon(
                  Icons.more_vert,color: Colors.white,               
                ), */
              )
            ],

          elevation: 0.0,

        ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 5.0),         
          children: <Widget>[
            SizedBox(height: 20.0),

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
            
            SizedBox(height: 20.0),

            BlocksCarouselWidget(blocksList: _con.blocks, heroTag: 'home_blocks'),  
            CategoriesCarouselWidget(categorysList: _con.categories, heroTag: 'home_categories'),        
            SizedBox(height: 20.0),
          ],
        ),
      ),

    );
  }
}




