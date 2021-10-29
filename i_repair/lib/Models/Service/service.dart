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
    required this.company,
  });

  String id;
  String companyId;
  String fieldId;
  String serviceName;
  String description;
  int price;
  String imageUrl;
  int status;
  dynamic company;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["Id"] ?? json["id"],
        companyId: json["CompanyId"] ?? json["companyId"],
        fieldId: json["FieldId"] ?? json["fieldId"],
        serviceName: json["ServiceName"] ?? json["serviceName"],
        description: json["Description"] ?? json["description"],
        price: json["Price"] ?? json["price"],
        imageUrl: json["ImageUrl"] ?? json["imageUrl"],
        status: json["Status"] ?? json["status"],
        company: json["Company"] ?? json["company"],
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
        "Company": company,
      };
}
