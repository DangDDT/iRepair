import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    required this.id,
    required this.avatar,
    required this.phoneNumber,
    required this.email,
    this.username,
    required this.createDate,
    required this.fullName,
    required this.uid,
  });

  String id;
  String avatar;
  String phoneNumber;
  String email;
  dynamic username;
  DateTime createDate;
  String fullName;
  String uid;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        username: json["username"],
        createDate: DateTime.parse(json["createDate"]),
        fullName: json["fullName"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "email": email,
        "username": username,
        "createDate": createDate.toIso8601String(),
        "fullName": fullName,
        "uid": uid,
      };
}
