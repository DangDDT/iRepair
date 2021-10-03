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
    this.picture,
    required this.isDelete,
  });

  String id;
  String name;
  String? description;
  String? picture;
  int isDelete;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["Id"],
        name: json["Name"],
        description: json["Description"],
        picture: json["Picture"],
        isDelete: json["Is_Delete"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Description": description,
        "Picture": picture,
        "Is_Delete": isDelete,
      };
}
