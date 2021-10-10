import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Address/Address.dart';
import 'package:i_repair/Models/Place/place_search.dart';
import 'package:i_repair/Services/map_services/places_service.dart';

class PlaceBloc with ChangeNotifier {
  final placesService = PlacesService();
  Address? selectedPlace;

  List<PlaceSearch> searchResults = <PlaceSearch>[];
  PlaceBloc() {}
  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedPlace(String placeId) async {
    selectedPlace = await placesService.getPlaceDetail(placeId);
    print(selectedPlace!.geometry.location);
    notifyListeners();
  }
}
