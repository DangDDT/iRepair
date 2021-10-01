import 'dart:convert';


List<Service> serviceFromJson(String str) => List<Service>.from(json.decode(str).map((x) => Service.fromJson(x)));

String serviceToJson(List<Service> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Service {
    Service({
        required this.id,
        this.serviceName,
        this.description,
        this.price,
        this.imageUrl,
        required this.isDelete,
        this.companyId,
        this.fieldId,
    });

    String id;
    String? serviceName;
    String? description;
    double? price;
    String? imageUrl;
    bool isDelete;
    String? companyId;
    String? fieldId;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"],
        serviceName: json["serviceName"],
        description: json["description"],
        price: json["price"].toDouble(),
        imageUrl: json["imageUrl"],
        isDelete: json["isDelete"],
        companyId: json["companyId"],
        fieldId: json["fieldId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "serviceName": serviceName,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
        "isDelete": isDelete,
        "companyId": companyId,
        "fieldId": fieldId,
    };
    
}
