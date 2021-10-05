import 'dart:convert';

List<Field> fieldFromJson(String str) =>
    List<Field>.from(json.decode(str).map((x) => Field.fromJson(x)));

String fieldToJson(List<Field> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Field {
  Field({
    required this.id,
    required this.name,
    this.description,
    required this.majorId,
    this.imageUrl,
    required this.status,
  });

  String id;
  String name;
  String? description;
  String majorId;
  String? imageUrl;
  int status;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        majorId: json["MajorId"],
        imageUrl: json["ImageUrl"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "MajorId": majorId,
        "ImageUrl": imageUrl,
        "Status": status,
      };
}
