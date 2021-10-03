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
    this.price,
    this.picture,
    required this.status,
    required this.isDelete,
  });

  String id;
  String companyId;
  String fieldId;
  String serviceName;
  String? description;
  int? price;
  String? picture;
  int status;
  int isDelete;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["Id"],
        companyId: json["Company_Id"],
        fieldId: json["Field_Id"],
        serviceName: json["Service_Name"],
        description: json["Description"],
        price: json["Price"],
        picture: json["Picture"],
        status: json["Status"],
        isDelete: json["Is_Delete"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Company_Id": companyId,
        "Field_Id": fieldId,
        "Service_Name": serviceName,
        "Description": description,
        "Price": price,
        "Picture": picture,
        "Status": status,
        "Is_Delete": isDelete,
      };
}
