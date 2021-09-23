class Major{
  String id;
  String name;
  String? description;
  String imageUrl;

  Major(
    {
      required this.id,
      required this.name,
      this.description,
      required this.imageUrl
    });
  factory Major.fromJson(Map<String, dynamic> json)
  {
    return Major(
    id: json["Id"] as String,
    name: json["Name"] as String,
    description: json["Description"] as String,
    imageUrl: json["Picture"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Picture'] = this.imageUrl;
    return data;
  }

  @override
  String toString(){
    return "{Id: $id, Name: $name , Description: $description, Picture: $imageUrl}";
  }
}

const List<Major> choices = const <Major>[
  const Major(id: 'M0001', name: 'Điện lạnh', description: '', imageUrl: "assets/images/refrigerator.png"),
  const Major(id: 'M0002', name: 'Điện tử', description: '', imageUrl: "assets/images/laptop-banner.png"),
  const Major(id: 'M0003', name: 'Khóa', description: '', imageUrl: "assets/images/security-system.png"),
  const Major(id: 'M0004', name: 'Xe máy', description: 'Đường ta đi của bố mẹ ta', imageUrl: "assets/images/motobike_1.png"),
  const Major(id: 'M0005', name: 'Hệ thống nước', description: '', imageUrl: "assets/images/plumber-banner.png"),
];