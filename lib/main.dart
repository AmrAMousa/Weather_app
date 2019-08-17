import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import './custom_widgets/DayInfo.dart';
import './models/weather_model.dart';
import 'package:backdrop/backdrop.dart';
main() => runApp(
    MaterialApp(
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
    ));


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  WeatherModel _weatherModel = new WeatherModel();


  GoogleMapController _mapController;
  final LatLng initialLatLng = LatLng(26.8349295,26.3815664);
  LatLng currentLatLng = LatLng(26.8349295,26.3815664);
  @override
  Widget build(BuildContext context) {

    return BackdropScaffold(
      iconPosition: BackdropIconPosition.action,
      headerHeight: MediaQuery.of(context).size.height*0.6,
      title: Text('weather app'),
      backLayer: Center(

        child: Text('hello'),
      ),
       frontLayer: Stack(
         children: <Widget>[
           GoogleMap(
             onTap: (LatLng latlong){
               setState(() {
                 currentLatLng=latlong;
                 _weatherModel.fetchData(http.Client(),latlong.latitude,latlong.longitude);
               });
             },
             markers: _weatherModel.currently['temperature']==null?{}:{
               Marker(
                 markerId: MarkerId('currentLatLng'),
                 position: currentLatLng,
                 icon: BitmapDescriptor.defaultMarkerWithHue(
                   BitmapDescriptor.hueGreen
                 ),
               ),
             },
             mapType: MapType.hybrid,
             initialCameraPosition: CameraPosition(
                 target: initialLatLng, zoom: 3.0, bearing: 10, tilt: 10),
             onMapCreated: (GoogleMapController controller){
               _mapController=controller;
             },
           ),
           _weatherModel.currently['icon']==null? Center():Positioned(
             bottom:  MediaQuery.of(context).size.height*0.1,
             left: MediaQuery.of(context).size.width*0.05,
             child: DayInfo(_weatherModel.currently['temperature'],
                 _weatherModel.currently['icon'],
                 _weatherModel.currently['summary'],
                 _weatherModel.currently['precipProbability'],
                 _weatherModel.currently['humidity'],
                 _weatherModel.currently['pressure'],
                 _weatherModel.currently['windSpeed'],
                 _weatherModel.currently['visibility'],
             ),
           )
         ],
       ),
    );
  }

  void _bottomSheetModel(latlong){

    showBottomSheet(context: context, builder: (builder){
      return Center(
        child: Text('hello'),
      );
    });
  }
}


