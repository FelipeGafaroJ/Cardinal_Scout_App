import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:com.cardinalscout/generated/i18n.dart';
import 'package:com.cardinalscout/src/controllers/compass_controller.dart';
import 'package:com.cardinalscout/src/elements/CircularLoadingWidget.dart';
import 'package:com.cardinalscout/src/helpers/helper.dart';
import 'package:compasstools/compasstools.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class CompassWidget extends StatefulWidget {

  @override
  
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  CompassWidget({Key key, this.parentScaffoldKey}) : super(key: key);


  _CompassWidgetState createState() => _CompassWidgetState();
}


class _CompassWidgetState extends StateMVC<CompassWidget> {
 int _haveSensor;
 String sensorType;

 @override

  void initState() {
  super.initState();
  checkDeviceSensors();
 }

 Future<void> checkDeviceSensors() async {

  //int _haveSensor;
  //String sensorType;


  /* @override
  void initState() {
    super.initState();
    checkDeviceSensors();
  } */

/* 
  Future<void> checkDeviceSensors() async {
    int haveSensor;
 */
 
    int haveSensor;

    try {
      haveSensor = await Compasstools.checkSensors;


      switch (haveSensor) {
        case 0:
          {
            sensorType = "No encontramos sensores en tu dispositivo para la Brujula";
          }
          break;


        case 1:
          {
            sensorType = "Acelerómetro + Magnetómetro";
          }
          break;


        case 2:
          {
            sensorType = "Giroscopio";
          }
          break;


        default:
          {
            sensorType = "Error!";
          }
          break;
      }
    } on Exception {


    }
    if (!mounted) return;


    setState(() {
      _haveSensor = haveSensor;
    });
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
        home: Scaffold(
          
          appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(7),
            

          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Image.network('https://i.ibb.co/wBNytqK/Logo-Prueba.png', height: 30,),
              Text(" Cardinal Scout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
              

            ],

          ),

           /*  actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal:16),
                child: Icon(
                  Icons.more_vert,color: Colors.white,
                ),

              )
            ], */

          elevation: 0.0,

        ),
          

          body: new Container(
            child: Column(
              children: <Widget>[StreamBuilder(
                stream: Compasstools.azimuthStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: new RotationTransition(
                            turns: new AlwaysStoppedAnimation(
                                -snapshot.data / 360),
                            child: Image.network('https://i.ibb.co/wBNytqK/Logo-Prueba.png'),
                          ) //
                      ),
                    );
                  }
                  else
                    return Text("Error en la transmisión");


                },
              ),
                Text("Anuncio Sensor Type " + sensorType),
              ],
            ),
          ),
        )
    );
  }

}
