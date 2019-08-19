import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state_management/g_maps_provider.dart';
import '../custom_widgets/DayInfo.dart';
import '../models/weather_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
class GMaps extends StatefulWidget {

  _GMapsState createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {

 WeatherModel _weatherModel = new WeatherModel();


  GoogleMapController _mapController;
  final LatLng initialLatLng = LatLng(26.8349295,26.3815664);
  LatLng currentLatLng = LatLng(26.8349295,26.3815664);
  MapType t = MapType.satellite;
  @override
  Widget build(BuildContext context) {
    final GMapsProvider mapsInfo = Provider.of<GMapsProvider>(context);
    return Container(
       child: Stack(
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
             mapType: mapsInfo.currntMapType,
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
}