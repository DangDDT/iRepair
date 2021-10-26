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
    required this.field,
    required this.orders,
    required this.workOns,
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
  dynamic field;
  List<dynamic> orders;
  List<dynamic> workOns;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        companyId: json["companyId"],
        fieldId: json["fieldId"],
        serviceName: json["serviceName"],
        description: json["description"],
        price: json["price"],
        imageUrl: json["imageUrl"],
        status: json["status"],
        company: json["company"],
        field: json["field"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        workOns: List<dynamic>.from(json["workOns"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyId": companyId,
        "fieldId": fieldId,
        "serviceName": serviceName,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "status": status,
        "company": company,
        "field": field,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "workOns": List<dynamic>.from(workOns.map((x) => x)),
      };
}
