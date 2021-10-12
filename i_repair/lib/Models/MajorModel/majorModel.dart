class MajorModel {
  const MajorModel(this.name, this.code);
  final String code;
  final String name;
  @override
  String toString() => name;
}

const List<MajorModel> majorList = <MajorModel>[
  MajorModel('Tủ lạnh', 'TL'),
  MajorModel('Xe máy', 'X2'),
  MajorModel('Máy giặt', 'MG'),
  MajorModel('Điện thoại', 'ĐT'),
  MajorModel('Máy tính', 'MT'),
  MajorModel('Xe ôtô', 'X4'),
  MajorModel('Ống nước', 'ON'),
  MajorModel('Máy lạnh', 'ML'),
  MajorModel('Bếp gas', 'BG'),
];
