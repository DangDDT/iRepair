class Customer {
  Customer({
    required this.id,
    required this.uid,
    required this.avatar,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.createDate,
    required this.fullName,
    required this.addresses,
    required this.orders,
  });

  String id;
  String uid;
  String avatar;
  String phoneNumber;
  String email;
  dynamic username;
  DateTime createDate;
  String fullName;
  List<dynamic> addresses;
  List<dynamic> orders;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        uid: json["uid"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        username: json["username"],
        createDate: DateTime.parse(json["createDate"]),
        fullName: json["fullName"],
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "email": email,
        "username": username,
        "createDate": createDate.toIso8601String(),
        "fullName": fullName,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "orders": List<dynamic>.from(orders.map((x) => x)),
      };
}
