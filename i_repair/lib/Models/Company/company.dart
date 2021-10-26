import 'dart:convert';

Company companyFromJson(String str) => Company.fromJson(json.decode(str));

String companyToJson(Company data) => json.encode(data.toJson());

class Company {
  Company({
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
    this.uid,
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
  dynamic uid;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
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
        uid: json["uid"],
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
        "uid": uid,
      };
}
