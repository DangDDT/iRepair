import 'dart:convert';

CurrentUser userFromJson(String str) => CurrentUser.fromJson(json.decode(str));

String userToJson(CurrentUser data) => json.encode(data.toJson());

class CurrentUser {
  CurrentUser({
    required this.id,
    required this.avatar,
    required this.email,
    required this.name,
    this.uid,
    this.addressDetail,
    this.phoneNumber,
    required this.token,
  });

  String id;
  String avatar;
  String email;
  String name;
  String? uid;
  dynamic phoneNumber;
  dynamic addressDetail;
  dynamic token;

  factory CurrentUser.fromJson(Map<String, dynamic> json) => CurrentUser(
        id: json["id"],
        avatar: json["avatar"],
        email: json["email"],
        name: json["fullName"],
        uid: json["uid"],
        addressDetail: json["addressDetail"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "email": email,
        "fullName": name,
        "uid": uid,
        "addressDetail": addressDetail,
        "phoneNumber": phoneNumber,
        "token": token,
      };
}
