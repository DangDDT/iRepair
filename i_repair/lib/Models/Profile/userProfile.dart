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
    required this.name,
    required this.companyId,
    required this.uid,
  });

  String id;
  String avatar;
  String phoneNumber;
  String email;
  String username;
  String name;
  String companyId;
  String uid;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        username: json["username"],
        name: json["name"],
        uid: json["uid"],
        companyId: json["companyId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "email": email,
        "username": username,
        "name": name,
        "uid": uid,
        "companyId": companyId,
      };
}
