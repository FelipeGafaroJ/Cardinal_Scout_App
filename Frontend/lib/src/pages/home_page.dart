import 'package:flutter/material.dart';

import 'package:cardinal_scout_app/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title:Text('Cardinal Scout - Herramientas'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ) ,
        ],
      ),


      body: Container(
        child:Column(
          children: <Widget>[
            _swiperTarjetas()

        ],
        )
      )

    );
  }

Widget _swiperTarjetas(){

  return  CardSwiper(
    herramientas:[1,2,3,4,5],
  );
}

}