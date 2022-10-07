import 'package:flutter/material.dart';
import 'package:smart_city/extras/strings.dart';

class Weather {
  DateTime date;
  double temp;
  double humidity;
  String weatherStateName;
  String city;
  String country;
  double pressure;
  double windSpeed;
  List<String> weakDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<String> yearMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String getWeatherStateName(context, language) {
    return Strings.strings[this.weatherStateName][language];
  }

  String getDayName(context, language) {
    return Strings.strings[weakDays[this.date.weekday - 1]][language];
  }

  String getMonthName(context, language) {
    return Strings.strings[yearMonths[this.date.month - 1]][language];
  }

  double getPressure() {
    return this.pressure;
  }

  String getDate(context, language) {
    return this.date.day.toString() +
        " " +
        getMonthName(context, language) +
        " " +
        this.date.year.toString();
  }

  double getHumidity() {
    return this.humidity;
  }

  double getTemprature() {
    return this.temp;
  }

  double getWindSpeed() {
    return this.windSpeed;
  }

  String getCountry() {
    return this.country;
  }

  String getCity() {
    return this.city;
  }

  Weather({
    required this.date,
    required this.temp,
    required this.humidity,
    required this.weatherStateName,
    required this.city,
    required this.country,
    required this.pressure,
    required this.windSpeed,
  });

  factory Weather.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return Weather(
      date: DateTime.parse(data['current']['last_updated']),
      temp: jsonData['avgtemp_c'],
      humidity: jsonData['avghumidity'],
      weatherStateName: jsonData['condition']['text'],
      country: data["location"]["country"],
      city: data["location"]["name"],
      pressure: data['current']['pressure_mb'],
      windSpeed: data['current']['wind_kph'],
    );
  }

  @override
  String toString() {
    return 'tem = $temp  humidity = $humidity  date = $date';
  }

  String getImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return 'assets/clear.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return 'assets/snow.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return 'assets/cloudy.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/rainy.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return 'assets/thunderstorm.png';
    } else {
      return 'assets/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
