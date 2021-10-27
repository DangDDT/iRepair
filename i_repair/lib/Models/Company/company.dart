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

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["Id"],
        companyName: json["CompanyName"],
        address: json["Address"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        description: json["Description"],
        email: json["Email"],
        hotline: json["Hotline"],
        imageUrl: json["ImageUrl"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyName": companyName,
        "Address": address,
        "lng": lng,
        "lat": lat,
        "Description": description,
        "Email": email,
        "Hotline": hotline,
        "ImageUrl": imageUrl,
        "Status": status,
      };
}
