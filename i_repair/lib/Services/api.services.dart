import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:i_repair/Models/Service/service.dart';

import '../Models/Major/major.dart';

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

  static Future<List<Service>> fetchServices() async {
    final String response =
        await rootBundle.loadString('lib/Models/Service/mock_service.json');
    return serviceFromJson(response);
  }
}
