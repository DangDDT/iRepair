import 'dart:convert';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
    this.price,
  });

  String id;
  String companyName;
  String address;
  double? lng;
  double? lat;
  String description;
  String email;
  String hotline;
  String imageUrl;
  int status;
  int? price;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["Id"] ?? json["id"],
        companyName: json["CompanyName"] ?? json["companyName"],
        address: json["Address"] ?? json["address"],
        lng: json["lng"],
        lat: json["lat"],
        description: json["Description"] ?? json["description"],
        email: json["Email"] ?? json["email"],
        hotline: json["Hotline"] ?? json["hotline"],
        imageUrl: json["ImageUrl"] ?? json["imageUrl"],
        status: json["Status"] ?? json["status"],
        price: json["Price"] ?? json["price"],
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
        "Price": price,
      };
}
