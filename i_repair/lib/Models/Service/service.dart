import 'dart:convert';

List<Service> serviceFromJson(String str) =>
    List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
  Service({
    required this.id,
    required this.companyId,
    required this.fieldId,
    required this.serviceName,
    this.description,
    required this.price,
    this.imageUrl,
    required this.status,
  });

  String id;
  String companyId;
  String fieldId;
  String serviceName;
  String? description;
  int price;
  String? imageUrl;
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
