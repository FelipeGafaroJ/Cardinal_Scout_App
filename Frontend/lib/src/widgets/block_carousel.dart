import 'package:flutter/material.dart';

//import 'package:flutter_travel_ui/models/destination_model.dart';
import 'package:cardinal_scout_app/src/pages/models/destination_model.dart';
import 'package:cardinal_scout_app/src/pages/models/block_model.dart';


//import 'package:flutter_travel_ui/screens/destination_screen.dart';
import 'package:cardinal_scout_app/src/pages/screens/destination_screen.dart';

import 'package:cardinal_scout_app/src/pages/screens/block_screen.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlockCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Desafíos',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
// Boton Derecho Ver todos

/*               GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),  */


            ],
          ),
        ),

        // Contenedor Grande Superior
        Container(
          height: 350.0,
        //  color :  Colors.blue,

          
/* 
          // prueba 

          color: Colors.blue,
          child: ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index){
              return Text(destinations[index].city);

            },           
            
            ),

          //Fin Prueba
 */



          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: blocks.length,
         

            itemBuilder: (BuildContext context, int index) {
              Block block = blocks[index];
              
             
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlockScreen(
                      block: block,
                    ),
                  ),
                ),

              // Contenedor hijo    
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  //Ancho contenedor blanco
                  width: 240.0,
               //   color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        // contenedor blanco interno
                                                
                        bottom: 15.0, // Baja o sub el contenedor blanco
                        child: Container(
                          height: 180.0,  // Tamaño contenedor
                          width: 240.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '${block.activities.length} actividades',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  block.description,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        
                        // imagen Desafios 
                        child: Stack(
                          children: <Widget>[
                            Hero(
                              tag: block.imageUrl,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  height: 180.0,
                                  width: 220.0,
                                  image: AssetImage(block.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    block.bloque,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  
                       /*            Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        destination.country,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
 */
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),

          

        ),
      ],
    );
  }
}







