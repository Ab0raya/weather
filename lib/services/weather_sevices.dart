import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';


class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '7338b220c3cd42f7be4143017232505';
  WeatherModel? weather;

  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.get(url);
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (e) {

    }
    return weather;
  }
}
