import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    required this.addressDetail,
    required this.geometry,
    required this.name,
  });

  String addressDetail;
  Geometry geometry;
  String name;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressDetail: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": addressDetail,
        "geometry": geometry.toJson(),
        "name": name,
      };
}

class Geometry {
  Geometry({
    required this.location,
  });

  Location location;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
  @override
  String toString() {
    return '$lng    $lat';
  }
}
