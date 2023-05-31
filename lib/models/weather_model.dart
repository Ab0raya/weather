import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  String state;
  String time;
  double maxTemp;
  double minTemp;
  double avgTemp;
  int cloudPercentage;
  int windPercentage;
  int humidityPercentage;

  WeatherModel(
      {required this.cityName,
      required this.state,
      required this.time,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.cloudPercentage,
      required this.windPercentage,
      required this.humidityPercentage});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        cityName: data['location']['name'],
        state: data['current']['condition']['text'],
        time: data['location']['localtime'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        avgTemp: jsonData['avgtemp_c'],
        cloudPercentage: data['current']['cloud'],
        windPercentage: data['current']['wind_degree'],
        humidityPercentage: data['current']['humidity']);
  }

  String backgroundSource() {
    int theHour = 0;
    if (time.length == 15) {
      theHour = int.parse(time[time.length - 4]);
      if (0 <= theHour && theHour < 6) {
        //night
        return 'assets/bg/nightBG.png';
      }
      if (6 <= theHour && theHour < 10) {
        //sunrise
        return 'assets/bg/sunriseBG.png';
      }
      if (10 <= theHour && theHour < 15) {
        //day
        return 'assets/bg/dayBG.png';
      }
      if (15 <= theHour && theHour < 19) {
        //sunset
        return 'assets/bg/sunsetBG.png';
      }
      if (19 <= theHour && theHour <= 24) {
        //night
        return 'assets/bg/nightBG.png';
      } else {
        return 'assets/bg/bg1.png';
      }
    }
    if (time.length == 16) {
      theHour = int.parse(time[11] + time[12]);
      if (0 <= theHour && theHour < 6) {
        //night
        return 'assets/bg/nightBG.png';
      }
      if (6 <= theHour && theHour < 10) {
        //sunrise
        return 'assets/bg/sunriseBG.png';
      }
      if (10 <= theHour && theHour < 16) {
        //day
        return 'assets/bg/dayBG.png';
      }
      if (16 <= theHour && theHour < 19) {
        //sunset
        return 'assets/bg/sunsetBG.png';
      }
      if (19 <= theHour && theHour <= 24) {
        //night
        return 'assets/bg/nightBG.png';
      } else {
        return 'assets/bg/bg1.png';
      }
    } else {
      return 'assets/bg/bg1.jpg';
    }
  }

  Color themeColorSource() {
    int theHour = 0;
    if (time.length == 15) {
      theHour = int.parse(time[time.length - 4]);
      if (0 <= theHour && theHour < 6) {
        //night
        return Colors.white;
      }
      if (6 <= theHour && theHour < 10) {
        //sunrise
        return const Color(0xffe3c4a8);
      }
      if (10 <= theHour && theHour < 15) {
        //day
        return const Color(0xff1b4658);
      }
      if (15 <= theHour && theHour < 19) {
        //sunset
        return const Color(0xffe78b7e);
      }
      if (19 <= theHour && theHour <= 24) {
        //night
        return Colors.white;
      } else {
        return Colors.white;
      }
    }
    if (time.length == 16) {
      theHour = int.parse(time[11] + time[12]);
      if (0 <= theHour && theHour < 6) {
        //night
        return Colors.white;
      }
      if (6 <= theHour && theHour < 10) {
        //sunrise
        return const Color(0xffe3c4a8);
      }
      if (10 <= theHour && theHour < 15) {
        //day
        return const Color(0xff1b4658);
      }
      if (15 <= theHour && theHour < 19) {
        //sunset
        return const Color(0xffe78b7e);
      }
      if (19 <= theHour && theHour <= 24) {
        //night
        return Colors.white;
      } else {
        return Colors.white;
      }
    } else {
      return Colors.white;
    }
  }
}
