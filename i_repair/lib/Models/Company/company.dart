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
        id: json["Id"] ?? json["id"],
        companyName: json["CompanyName"] ?? json["companyName"],
        address: json["Address"] ?? json["address"],
        lng: json["Lng"] ?? json["lng"],
        lat: json["Lat"] ?? json["lat"],
        description: json["Description"] ?? json["description"],
        email: json["Email"] ?? json["email"],
        hotline: json["Hotline"] ?? json["hotline"],
        imageUrl: json["ImageUrl"] ?? json["imageUrl"],
        status: json["Status"] ?? json["status"],
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
