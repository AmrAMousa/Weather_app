import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherModel {

  Map<String,dynamic>currently={};
  List<Map<String, dynamic>> data=[];
  String timezone='';

  fetchData(http.Client client, double latitude, double longitude) async {
    final response =
    await client.get(
        'https://api.darksky.net/forecast/Your_Key/$latitude,$longitude');
    final parsedJson = jsonDecode(response.body);
    currently =parsedJson['currently'];
    timezone =parsedJson['timezone'];
  }
}
