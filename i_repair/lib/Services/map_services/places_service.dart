import 'package:http/http.dart' as http;
import 'package:i_repair/Models/Address/Address.dart';
import 'dart:convert' as convert;

import 'package:i_repair/Models/Place/place_search.dart';

class PlacesService {
  String apiKey = 'r1byucUIdryguz7i0L8e1BKvV93jCu3YTQtOD0SK';
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = Uri.parse(
        "https://rsapi.goong.io/Place/AutoComplete?api_key=$apiKey&input=$search");
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    print(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<Address> getPlaceDetail(String placeId) async {
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=name%2Cgeometry/location%2Cformatted_address&key=$apiKey");
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['result'];
    return Address.fromJson(jsonResults);
  }
}
