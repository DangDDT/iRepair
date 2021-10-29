import 'dart:convert';

List<Major> majorFromJson(String str) =>
    List<Major>.from(json.decode(str).map((x) => Major.fromJson(x)));

String majorToJson(List<Major> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Major {
  Major({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.status,
  });

  String id;
  String name;
  String? description;
  String? imageUrl;
  int status;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["Id"] ?? json["id"],
        name: json["Name"] ?? json["name"],
        description: json["Description"] ?? json["description"],
        imageUrl: json["ImageUrl"] ?? json["imageUrl"],
        status: json["Status"] ?? json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "ImageUrl": imageUrl,
        "Status": status,
      };
}
