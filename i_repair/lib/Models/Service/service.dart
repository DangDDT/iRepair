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
    required this.description,
    required this.imageUrl,
    required this.status,
  });

  String id;
  String companyId;
  String fieldId;
  String serviceName;
  String description;
  String imageUrl;
  int status;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["Id"] ?? json["id"],
        companyId: json["CompanyId"] ?? json["companyId"],
        fieldId: json["FieldId"] ?? json["fieldId"],
        serviceName: json["ServiceName"] ?? json["serviceName"],
        description: json["Description"] ?? json["description"],
        imageUrl: json["ImageUrl"] ?? json["imageUrl"],
        status: json["Status"] ?? json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CompanyId": companyId,
        "FieldId": fieldId,
        "ServiceName": serviceName,
        "Description": description,
        "ImageUrl": imageUrl,
        "Status": status,
      };
}
