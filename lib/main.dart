import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/state_management/g_maps_provider.dart';
import 'Home.dart';

main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<GMapsProvider>.value(
          value: GMapsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.green[200],
        ),
      ),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
