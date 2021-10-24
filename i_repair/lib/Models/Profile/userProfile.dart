import 'dart:convert';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    required this.id,
    required this.avatar,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.createDate,
    required this.fullName,
    required this.uid,
  });

  String id;
  String avatar;
  String phoneNumber;
  String email;
  String username;
  DateTime createDate;
  String fullName;
  String uid;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
