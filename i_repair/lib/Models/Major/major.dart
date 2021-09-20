class Major {
  const Major({required this.title, required this.imageLink});
  final String title;
  final String imageLink;
}

const List<Major> choices = const <Major>[
  const Major(title: 'Ống nước', imageLink: "assets/images/plumber.svg"),
  const Major(title: 'Khóa', imageLink: "assets/images/locksmith.svg"),
  const Major(title: 'Máy tính', imageLink: "assets/images/laptop.svg"),
  const Major(title: 'Xe 2 bánh', imageLink: "assets/images/bike.svg"),
  const Major(title: 'Xe 4 bánh', imageLink: "assets/images/car.svg"),
  const Major(
      title: 'Gia dụng', imageLink: "assets/images/electric-appliance.svg"),
];
