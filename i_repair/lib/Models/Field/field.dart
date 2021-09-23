class Field{
  String id;
  String name;
  String major_id;
  String? description;
  String imageUrl;

  Field(
    {
      required this.id,
      required this.name,
      required this.major_id,
      this.description,
      required this.imageUrl
    });
  factory Field.fromJson(Map<String, dynamic> json)
  {
    return Field(
    id: json["id"] as String,
    name: json["Name"] as String,
    major_id: json["Major_id"] as String,
    description: json["Description"] as String,
    imageUrl: json["Picture"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Major_id'] = this.major_id;
    data['Description'] = this.description;
    data['Picture'] = this.imageUrl;
    return data;
  }

  @override
  String toString(){
    return "{Id: $id, Name: $name, Major_id: $major_id, Description: $description, Picture: $imageUrl}";
  }
}

const List<Field> choices = const <Field>[
  const Field(id: 'F0001', name: 'Tủ lạnh', major_id: 'M0001', description: '', imageUrl: "assets/images/refrigerator.png"),
  const Field(id: 'F0002', name: 'Máy lạnh', major_id: 'M0001', description: 'Sửa xong lạnh hơn Bắc cực', imageUrl: "assets/images/air_conditioner.png"),
  const Field(id: 'F0003', name: 'Máy giặt', major_id: 'M0001', description: 'Đồ dơ khỏi mặc', imageUrl: "assets/images/washing_machine.png"),
  const Field(id: 'F0004', name: 'Xe tay ga', major_id: 'M0004', description: 'Đường ta đi của bố mẹ ta', imageUrl: "assets/images/motobike_1.png"),
  const Field(id: 'F0005', name: 'Xe số', major_id: 'M0004', description: 'Giải phóng nhà bố mày hộ cái', imageUrl: "assets/images/motobike_2.png"),
];