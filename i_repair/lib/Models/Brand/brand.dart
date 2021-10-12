class Brand {
  const Brand(this.name, this.code, this.majorCode);
  final String code;
  final String name;
  final List<String> majorCode;
  @override
  String toString() => name;
}

const List<Brand> brandList = <Brand>[
  Brand("Samsung", "B01", ["ML", "MG", "TL", "MT"]),
  Brand("Panasonic", "B02", ["ML", "MG", "TL"]),
  Brand("Daikin", "B03", ["ML", "MG", "TL"]),
  Brand("Electrolux", "B04", ["ML", "MG", "TL"]),
  Brand("LG", "B05", ["ML", "MG", "TL"]),
  Brand("Toshiba", "B06", ["ML", "MG", "TL"]),
  Brand("Sharp", "B07", ["ML", "MG", "TL"]),
  Brand("Sanyo", "B08", ["ML", "MG"]),
  Brand("Mitsubishi Electric", "B09", ["ML", "MG", "TL"]),
  Brand("Casper", "B10", ["MG"]),
  Brand("Aqua", "B11", ["TL"]),
  Brand("Beko", "B12", ["TL"]),
  Brand("Midea", "B13", ["TL"]),
  Brand("Honda", "B14", ["X2", "X4"]),
  Brand("Yamaha", "B15", ["X2"]),
  Brand("Piaggio", "B16", ["X2"]),
  Brand("SYM", "B17", ["X2"]),
  Brand("Suzuki", "B18", ["X2", "X4"]),
  Brand("Triumph", "B19", ["X2"]),
  Brand("Harley Davidson", "B20", ["X2"]),
  Brand("Ducati", "B21", ["X2"]),
  Brand("Kawasaki", "B22", ["X2"]),
  Brand("Toyota", "B23", ["X4"]),
  Brand("Chevrolet", "B24", ["X4"]),
  Brand("Ford", "B25", ["X4"]),
  Brand("Hyundai", "B26", ["X4"]),
  Brand("Isuzu", "B27", ["X4"]),
  Brand("Kia", "B28", ["X4"]),
  Brand("Mitsubishi", "B29", ["X4"]),
  Brand("Lexus", "B30", ["X4"]),
  Brand("Mazda", "B31", ["X4"]),
  Brand("Subaru", "B32", ["X4"]),
  Brand("Ssangyong", "B33", ["X4"]),
  Brand("Land Rover", "B34", ["X4"]),
  Brand("Peugeot", "B35", ["X4"]),
  Brand("Porsche", "B36", ["X4"]),
  Brand("Volkswagen", "B37", ["X4"]),
  Brand("Mercedes Benz", "B38", ["X4"]),
  Brand("BMW", "B39", ["X4"]),
  Brand("Mini Cooper", "B40", ["X4"]),
  Brand("Audi", "B41", ["X4"]),
  Brand("Lamborghini", "B42", ["X4"]),
  Brand("Volvo", "B43", ["X4"]),
  Brand("Jaguar", "B44", ["X4"]),
  Brand("Maserati", "B45", ["X4"]),
  Brand("Aston Martin", "B46", ["X4"]),
  Brand("Bentley", "B47", ["X4"]),
  Brand("Vinfast", "B48", ["X4"]),
  Brand("Rinnai", "B49", ["BG"]),
  Brand("Giovani", "B50", ["BG"]),
  Brand("Faber", "B51", ["BG"]),
  Brand("Teka", "B52", ["BG"]),
  Brand("Taka", "B53", ["BG"]),
  Brand("Binova", "B54", ["BG"]),
  Brand("Paloma", "B55", ["BG"]),
  Brand("Sunhouse", "B56", ["BG"]),
  Brand("NaMilux", "B57", ["BG"]),
  Brand("Sakura", "B58", ["BG"]),
  Brand("Apple", "B59", ["MT"]),
  Brand("Dell", "B60", ["MT"]),
  Brand("Asus", "B61", ["MT"]),
  Brand("HP", "B62", ["MT"]),
  Brand("Lenovo", "B63", ["MT"]),
  Brand("MSI", "B64", ["MT"]),
  Brand("Acer", "B65", ["MT"]),
  Brand("Khác", "B66", ["TL", "X2", "MG", "MT", "X4", "ON", "ML", "BG"]),
];
List<Brand> getBrandByMajor(String majorCode) {
  List<Brand> list = [];
  for (Brand r in brandList) {
    if (r.majorCode.contains(majorCode)) {
      list.add(r);
    }
  }
  return list;
}
