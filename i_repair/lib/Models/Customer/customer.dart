class Customer {
  Customer({
    required this.id,
    required this.avatar,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.createDate,
    required this.fullName,
  });

  String id;
  String avatar;
  String phoneNumber;
  String email;
  dynamic username;
  DateTime createDate;
  String fullName;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["Id"],
        avatar: json["Avatar"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        username: json["Username"],
        createDate: DateTime.parse(json["CreateDate"]),
        fullName: json["FullName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Avatar": avatar,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Username": username,
        "CreateDate": createDate.toIso8601String(),
        "FullName": fullName,
      };
}
