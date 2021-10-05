import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Major/major.dart';
import 'package:i_repair/Models/Service/service.dart';

final endpoint = dotenv.get('MOBILE_APP_API_URL');

class APIServices {
  static Future fetchWeatherForecast() async {
    return await http.get(
      Uri.parse("https://irepair-api.herokuapp.com/WeatherForecast"),
    );
  }

  static Future<List<Major>> fetchMajors() async {
    final response = await http.get(
      Uri.parse("$endpoint/api/v1.0/major"),
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
      Uri.parse("$endpoint/api/v1.0/major_field/"),
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
    String qParamString = '?';
    majors.forEach((element) => {qParamString += 'listMajorId=${element.id}&'});
    qParamString = qParamString.substring(0, qParamString.lastIndexOf('&'));
    final response = await http.get(
      Uri.parse("$endpoint/api/v1.0/major_field$qParamString"),
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      print("API fetchFieldsByMajorsAPI() success");
      return fieldFromJson(response.body);
    } else {
      throw Exception('Failed to load field');
    }
  }

  static Future<List<Service>> fetchServicesByField(Field field) async {
    String qParamString = "?";
    qParamString += "FieldId=${field.id}";
    final response = await http.get(
      Uri.parse("$endpoint/api/v1.0/service/$qParamString"),
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
