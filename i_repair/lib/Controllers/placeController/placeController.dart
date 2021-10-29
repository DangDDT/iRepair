import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Address/Address.dart';
import 'package:i_repair/Models/Place/place_search.dart';
import 'package:i_repair/Services/map_services/places_service.dart';

class PlaceBloc with ChangeNotifier {
  final placesService = PlacesService();
  Address? selectedPlace;
  Address? selectedPlaceProfile;
  List<PlaceSearch> searchResults = <PlaceSearch>[];
  List<PlaceSearch> searchResultsProfile = <PlaceSearch>[];
  PlaceBloc() {}
  searchPlaces(String searchTerm) async {
    if (!searchTerm.isEmpty) {
      searchResults = await placesService.getAutocomplete(searchTerm);
      print(searchResults);
      notifyListeners();
    } else {
      searchResults.clear();
      notifyListeners();
    }
  }

  searchPlacesProfile(String searchTerm) async {
    if (!searchTerm.isEmpty) {
      searchResultsProfile = await placesService.getAutocomplete(searchTerm);
      print(searchResultsProfile);
      notifyListeners();
    } else {
      searchResultsProfile.clear();
      notifyListeners();
    }
  }

  setSelectedPlace(String placeId) async {
    selectedPlace = await placesService.getPlaceDetail(placeId);
    print(selectedPlace!.geometry.location);
    notifyListeners();
  }

  setSelectedPlaceProfile(String placeId) async {
    selectedPlaceProfile = await placesService.getPlaceDetail(placeId);
    print(selectedPlaceProfile!.geometry.location);
    notifyListeners();
  }
}
