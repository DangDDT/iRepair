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
  String createDate;
  String fullName;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["Id"] ?? json["id"],
        avatar: json["Avatar"] ?? json["avatar"],
        phoneNumber: json["PhoneNumber"] ?? json["phoneNumber"],
        email: json["Email"] ?? json["email"],
        username: json["Username"] ?? json["username"],
        createDate: json["CreateDate"] ?? json["createDate"],
        fullName: json["FullName"] ?? json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Avatar": avatar,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Username": username,
        "CreateDate": createDate,
        "FullName": fullName,
      };
}
