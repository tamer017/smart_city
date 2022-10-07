import 'package:flutter/cupertino.dart';
import '../model/weather.dart';
import 'package:http/http.dart' as http;
import 'package:smart_city/model/weather.dart';
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  Weather? weatherData;
  String baseUrl = 'http://api.weatherapi.com/v1';

  String apiKey = '144d7ff4e40644039d410210220510';
  String? cityName;

  getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    Weather weather = Weather.fromJson(data); 
    weatherData = weather;
    notifyListeners();
    // Weather? get weatherData => _weatherData;
  }
}
