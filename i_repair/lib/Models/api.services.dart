import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Major/major.dart';

class APIServices {
  static Future fetchWeatherForecast() async {
    return await http.get(
      Uri.parse("https://irepair-api.herokuapp.com/WeatherForecast"),
    );
  }

  static Future<List<Major>> fetchMajors() async {
    final String response =
        await rootBundle.loadString('lib/Models/Major/mock_major.json');
    return majorFromJson(response);
  }
}
