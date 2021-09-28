import 'dart:convert';

import 'package:i_repair/Models/Major/major.dart';

List<Field> majorFromJson(String str) =>
    List<Field>.from(json.decode(str).map((x) => Field.fromJson(x)));

String majorToJson(List<Field> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Field {
  String id;
  String name;
  String majorId;
  String? description;
  String imageUrl;

  Field(
      {required this.id,
      required this.name,
      required this.majorId,
      this.description,
      required this.imageUrl});
  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json["id"] as String,
      name: json["Name"] as String,
      majorId: json["MajorId"] as String,
      description: json["Description"] as String,
      imageUrl: json["Picture"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['MajorId'] = this.majorId;
    data['Description'] = this.description;
    data['Picture'] = this.imageUrl;
    return data;
  }

  @override
  String toString() {
    return "{Id: $id, Name: $name, Major_id: $majorId, Description: $description, Picture: $imageUrl}";
  }

  static List<Field> getFieldByMajor(List<Major> majors) {
    List<Field> list = [];
    for (Field field in choices) {
      for (Major major in majors)
        if (field.majorId == major.id) {
          list.add(field);
        }
    }
    return list;
  }

  static List<Field> choices = [
    Field(
        id: 'F0001',
        name: 'Tủ lạnh',
        majorId: 'M0001',
        description: '',
        imageUrl: "assets/images/refrigerator.png"),
    Field(
        id: 'F0002',
        name: 'Máy lạnh',
        majorId: 'M0001',
        description: '',
        imageUrl: "assets/images/air_conditioner.png"),
    Field(
        id: 'F0003',
        name: 'Máy giặt',
        majorId: 'M0001',
        description: '',
        imageUrl: "assets/images/washing_machine.png"),
    Field(
        id: 'F0004',
        name: 'Xe tay ga',
        majorId: 'M0004',
        description: '',
        imageUrl: "assets/images/motobike_1.png"),
    Field(
        id: 'F0005',
        name: 'Khóa chốt vặn',
        majorId: 'M0003',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0006',
        name: 'Khóa chữ L',
        majorId: 'M0003',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0007',
        name: 'Khóa chữ U',
        majorId: 'M0003',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0008',
        name: 'Ống nước nhà vệ sinh',
        majorId: 'M0005',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0009',
        name: 'Ống nước nhà bếp',
        majorId: 'M0005',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0010',
        name: 'Ống thoát nước',
        majorId: 'M0005',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0011',
        name: 'Ống dẫn gas',
        majorId: 'M0007',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0012',
        name: 'Điện thoại',
        majorId: 'M0002',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0013',
        name: 'Laptop',
        majorId: 'M0002',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
    Field(
        id: 'F0014',
        name: 'Xe tải',
        majorId: 'M0006',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
  ];
}
