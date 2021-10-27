import 'dart:convert';
// To parse this JSON data, do
//
//     final serviceDetail = serviceDetailFromJson(jsonString);

List<ServiceDetail> serviceDetailFromJson(String str) =>
    List<ServiceDetail>.from(
        json.decode(str).map((x) => ServiceDetail.fromJson(x)));

String serviceDetailToJson(List<ServiceDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceDetail {
  ServiceDetail({
    required this.service,
    required this.field,
    required this.company,
  });

  Service service;
  Field field;
  Company company;

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
        service: Service.fromJson(json["Service"]),
        field: Field.fromJson(json["Field"]),
        company: Company.fromJson(json["Company"]),
      );

  Map<String, dynamic> toJson() => {
        "Service": service.toJson(),
        "Field": field.toJson(),
        "Company": company.toJson(),
      };
}

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

class Field {
  Field({
    required this.id,
    required this.name,
    required this.description,
    required this.majorId,
    required this.imageUrl,
    required this.status,
  });

  String id;
  String name;
  String description;
  String majorId;
  String imageUrl;
  int status;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        majorId: json["majorId"],
        imageUrl: json["imageUrl"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "majorId": majorId,
        "imageUrl": imageUrl,
        "status": status,
      };
}

class Service {
  Service({
    required this.id,
    required this.companyId,
    required this.fieldId,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.status,
  });

  String id;
  String companyId;
  String fieldId;
  String serviceName;
  String description;
  int price;
  String imageUrl;
  int status;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["Id"],
        companyId: json["CompanyId"],
        fieldId: json["FieldId"],
        serviceName: json["ServiceName"],
        description: json["Description"],
        price: json["Price"],
        imageUrl: json["ImageUrl"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyId": companyId,
        "FieldId": fieldId,
        "ServiceName": serviceName,
        "Description": description,
        "Price": price,
        "ImageUrl": imageUrl,
        "Status": status,
      };
}
