class Major {
  const Major({required this.title, required this.imageLink});
  final String title;
  final String imageLink;
}

const List<Major> choices = const <Major>[
  const Major(title: 'Ống nước', imageLink: "assets/images/laptop-man.png"),
  const Major(title: 'Khóa', imageLink: "assets/images/locksmith.png"),
  const Major(title: 'Máy tính', imageLink: "assets/images/laptop-man.png"),
  const Major(title: 'Xe 2 bánh', imageLink: "assets/images/motorbike.png"),
  const Major(title: 'Xe 4 bánh', imageLink: "assets/images/motorbike.png"),
  const Major(
      title: 'Điện lạnh', imageLink: "assets/images/air-conditioner.png"),
  const Major(title: 'Điện tử', imageLink: "assets/images/appliances.png"),
];
