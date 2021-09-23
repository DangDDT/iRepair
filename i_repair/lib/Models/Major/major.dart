// To parse this JSON data, do
//
//     final majors = majorsFromJson(jsonString);

import 'dart:convert';

Majors majorsFromJson(String str) => Majors.fromJson(json.decode(str));

String majorsToJson(Majors data) => json.encode(data.toJson());

class Majors {
  Majors({
    required this.majors,
  });

  List<Major> majors;

  factory Majors.fromJson(Map<String, dynamic> json) => Majors(
        majors: List<Major>.from(json["majors"].map((x) => Major.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "majors": List<dynamic>.from(majors.map((x) => x.toJson())),
      };
}

class Major {
  Major({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  String id;
  String name;
  String description;
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
