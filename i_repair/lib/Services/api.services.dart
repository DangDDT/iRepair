import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Service/service.dart';

class APIServices {
  static Future fetchWeatherForecast() async {
    return await http.get(
      Uri.parse("https://irepair-api.herokuapp.com/WeatherForecast"),
    );
  }

  static Future<List<Major>> fetchMajors() async {
    final response = await http.get(
      Uri.parse(
          "https://ec2-3-1-222-201.ap-southeast-1.compute.amazonaws.com/api/v1.0/major/get-all"),
    );
    if (response.statusCode == 200) {
      print("API fetchMajorsAPI() success");
      return majorFromJson(response.body);
    } else {
      throw Exception('Failed to load major');
    }
  }

  static Future<List<Field>> fetchFields() async {
    final response = await http.get(
      Uri.parse(
          "https://ec2-3-1-222-201.ap-southeast-1.compute.amazonaws.com/api/v1.0/major_field/get-all"),
    );
    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 1));
      print("API fetchFieldsAPI() success");
      return fieldFromJson(response.body);
    } else {
      throw Exception('Failed to load field');
    }
  }

  static Future<List<Field>> fetchFieldsByMajors(List<Major> majors) async {
    List<String> majorIds = [];
    majors.forEach((element) => {majorIds.add(element.id)});
    var body = json.encode(majorIds);
    final response = await http.post(
        Uri.parse(
            "https://ec2-3-1-222-201.ap-southeast-1.compute.amazonaws.com/api/v1.0/major_field/get-all-fields-by-majors"),
        headers: {"content-type": "application/json"},
        body: body);
    if (response.statusCode == 200) {
      print("API fetchFieldsByMajorsAPI() success");
      return fieldFromJson(response.body);
    } else {
      throw Exception('Failed to load field');
    }
  }

  static Future<List<Service>> fetchServicesByField(Field field) async {
    Map<String, String> qParam = {
      'id': '${field.id}',
    };
    final response = await http.get(
      Uri.https("ec2-3-1-222-201.ap-southeast-1.compute.amazonaws.com",
          "/api/v1.0/service/get-by-field-id/", qParam),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      print("API fetchServicesByFieldAPI() success");
      return serviceFromJson(response.body);
    } else {
      throw Exception('Failed to load service');
    }
  }
}
