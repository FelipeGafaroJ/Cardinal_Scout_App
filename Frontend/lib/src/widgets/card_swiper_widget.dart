import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  final List<dynamic> herramientas;


CardSwiper({this.herramientas});


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
    padding: EdgeInsets.only(top:10.0),
 
     child: Swiper(
          layout: SwiperLayout.STACK,
            itemWidth: _screenSize.width * 0.8,
            itemHeight: _screenSize.height * 0.7,
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network("https://image.freepik.com/vector-gratis/fondo-lineas-zoom-estilo-comico-verde-vacio_1017-20555.jpg",
                  fit: BoxFit.cover )

            );
            
          },
          itemCount: herramientas.length,
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
      ),
      
  );
  }
}