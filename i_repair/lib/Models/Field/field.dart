class Field {
  Field({
    required this.id,
    required this.name,
    required this.description,
    required this.majorId,
    required this.imageUrl,
    required this.status,
    required this.major,
    required this.services,
  });

  String id;
  String name;
  String description;
  String majorId;
  String imageUrl;
  int status;
  dynamic major;
  List<dynamic> services;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        majorId: json["majorId"],
        imageUrl: json["imageUrl"],
        status: json["status"],
        major: json["major"],
        services: List<dynamic>.from(json["services"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "majorId": majorId,
        "imageUrl": imageUrl,
        "status": status,
        "major": major,
        "services": List<dynamic>.from(services.map((x) => x)),
      };
}
