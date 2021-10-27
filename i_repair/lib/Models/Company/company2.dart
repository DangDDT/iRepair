import 'dart:convert';

Company2 company2FromJson(String str) => Company2.fromJson(json.decode(str));

String company2ToJson(Company2 data) => json.encode(data.toJson());

class Company2 {
  Company2({
    required this.id,
    required this.companyName,
    required this.address,
    required this.lng,
    required this.lat,
    required this.description,
    required this.email,
    required this.hotline,
    required this.imageUrl,
    required this.status,
  });

  String id;
  String companyName;
  String address;
  double lng;
  double lat;
  String description;
  String email;
  String hotline;
  String imageUrl;
  int status;

  factory Company2.fromJson(Map<String, dynamic> json) => Company2(
        id: json["id"],
        companyName: json["companyName"],
        address: json["address"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        description: json["description"],
        email: json["email"],
        hotline: json["hotline"],
        imageUrl: json["imageUrl"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyName": companyName,
        "address": address,
        "lng": lng,
        "lat": lat,
        "description": description,
        "email": email,
        "hotline": hotline,
        "imageUrl": imageUrl,
        "status": status,
      };
}
