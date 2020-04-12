import 'package:flutter/material.dart';

//import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:cardinal_scout_app/src/widgets/block_carousel.dart';


//import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:cardinal_scout_app/src/widgets/hotel_carousel.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


//Iconos Superiores Dash
class _HomeScreenState extends State<HomeScreen> {
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
        centerTitle: false,
        title:Text('Cardinal Scout'),
        backgroundColor: Colors.cyan[300],
/*         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ) ,
        ], */
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 5.0),
         // padding: EdgeInsets.symmetric(vertical: 30.0),
          
          children: <Widget>[
/*             Padding(              
              padding: EdgeInsets.only(left: 135.0, right: 100.0),
              child: Text(
                'DashBoard',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ), */

            // Mapa de iconos
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),

// Carrusel
            BlockCarousel(),
            SizedBox(height: 20.0),


            HotelCarousel(),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value; 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bubble_chart,
              // Icons.apps,
              //Icons.more_horiz,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://i.ibb.co/Xx9MrQ3/Goku.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
