class Field {
  Field({
    required this.id,
    required this.name,
    required this.description,
    required this.majorId,
    required this.imageUrl,
    required this.status,
  });

  String id;
  String name;
  String description;
  String majorId;
  String imageUrl;
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
        "id": id,
        "name": name,
        "description": description,
        "majorId": majorId,
        "imageUrl": imageUrl,
        "status": status,
      };
}
