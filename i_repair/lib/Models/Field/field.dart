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
    this.picture,
    required this.isDelete,
  });

  String id;
  String name;
  String? description;
  String majorId;
  String? picture;
  int isDelete;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        majorId: json["Major_Id"],
        picture: json["Picture"],
        isDelete: json["Is_Delete"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "Major_Id": majorId,
        "Picture": picture,
        "Is_Delete": isDelete,
      };
}
