import 'package:http/http.dart' as http;

class APIServices {
  static Future fetchField() async {
    return await http.get(
      Uri.parse("https://irepair-api.herokuapp.com/"),
    );
  }
}