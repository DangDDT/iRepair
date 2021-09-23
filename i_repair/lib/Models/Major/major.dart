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
    required this.imageUrl,
  });

  String id;
  String name;
  String? description;
  String imageUrl;

  factory Major.fromJson(Map<String, dynamic> json) => Major(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
      };
  static List<Major> getMajorList = [
    Major(
        id: 'M0001',
        name: 'Điện lạnh',
        description: '',
        imageUrl: "assets/images/electric-appliance.svg"),
    Major(
        id: 'M0002',
        name: 'Điện tử',
        description: '',
        imageUrl: "assets/images/laptop.svg"),
    Major(
        id: 'M0003',
        name: 'Khóa',
        description: '',
        imageUrl: "assets/images/locksmith.svg"),
    Major(
        id: 'M0004',
        name: 'Xe máy',
        description: '',
        imageUrl: "assets/images/bike.svg"),
    Major(
        id: 'M0005',
        name: 'Ống nước',
        description: '',
        imageUrl: "assets/images/plumber.svg"),
    Major(
        id: 'M0006',
        name: 'Xe hơi',
        description: '',
        imageUrl: "assets/images/car.svg"),
  ];
}
