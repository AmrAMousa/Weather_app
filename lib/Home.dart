
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/custom_widgets/g_maps.dart';
import 'package:backdrop/backdrop.dart';
import 'package:provider/provider.dart';
import './state_management/g_maps_provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 
  @override
  Widget build(BuildContext context) {

    final GMapsProvider mapsInfo = Provider.of<GMapsProvider>(context);

    Widget changeMapsType = DropdownButton(
      items: [
        DropdownMenuItem(
          child: Text('normal'),
          value: MapType.normal,
        ),
        DropdownMenuItem(
          child: Text('hybrid'),
          value: MapType.hybrid,
        ),
      ],
      onChanged: (value){
          setState(() {
           mapsInfo.currntMapType = value; 
          });
      },
      value: mapsInfo.currntMapType,
    );




    return BackdropScaffold(
        iconPosition: BackdropIconPosition.action,
        headerHeight: MediaQuery.of(context).size.height*0.6,
        title: Text('weather app'),
        backLayer: Column(
    children: <Widget>[
ListTile(
  title: Text('Map type'),
  trailing: changeMapsType,
)
    ],
        ),
         frontLayer: GMaps(),
      );
  }


}