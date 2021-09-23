import 'package:http/http.dart' as http;

class APIServices {
  static Future fetchMajor() async {
    return await http.get(
      Uri.parse("https://irepair-api.herokuapp.com/"),
    );
  }
}