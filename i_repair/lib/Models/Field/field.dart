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

  List<Field> choices = [
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
        name: 'Xe số',
        majorId: 'M0004',
        description: '',
        imageUrl: "assets/images/motobike_2.png"),
  ];
}
