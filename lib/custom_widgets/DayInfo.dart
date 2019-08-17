import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayInfo extends StatelessWidget{
  
  Map icons = {
    "clear-day" : "assets/icons/big_sun.svg",
    "clear-night" : "assets/icons/big_sun.svg",
    "rain" : "assets/icons/rainy_icon.svg",
    "snow" : "assets/icons/rain_snow_icon.svg",
    "sleet" : "assets/icons/wind_icon.svg",
    "wind" : "assets/icons/wind_icon.svg",
    "fog" : "assets/icons/fog_icon.svg",
    "cloudy" : "assets/icons/cloudy_icon.svg",
    "partly-cloudy-day" : "assets/icons/sun_cloud_icon.svg",
    "partly-cloudy-night" : "assets/icons/sun_cloud_icon.svg",
    "hail" : "assets/icons/big_sun.svg",
    "thunderstorm" : "assets/icons/thunder_icon.svg",
    "tornado" : "assets/icons/wind_icon.svg",
  };
  num temperature;
  String icon;
  String summary;
  num precipProbability;
  num humidity;
  num pressure;
  num windSpeed;
  num visibility;
  DayInfo(this.temperature,this.icon,this.summary,this.precipProbability,this.humidity,this.pressure,this.windSpeed,this.visibility);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            new BoxShadow(
              color: Colors.black,
              blurRadius: 20.0,
            ),
          ]),
      width: MediaQuery.of(context).size.width *0.9,
      height: MediaQuery.of(context).size.height * 0.30,
      child: temperature == null
          ? Center(
              child: Text('Click on any point'),
            )
          : ListView(

              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '$temperature°F',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(
                            icons[icon],
                            width: 32,
                            height: 32,
                          ),
                          Text(summary,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),),

                      ],
                    )
                    ]),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/rain.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text('rain: $precipProbability'),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/humidity.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text('humidity: $humidity'),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/wind_speed.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text('wind Speed: $windSpeed m/h'),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        'assets/icons/visibility.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Text('visibility: $visibility'),
                  ],
                )
              ],
            ),
    );
  }
}
