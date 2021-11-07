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
    required this.rating,
  });

  String id;
  String avatar;
  String phoneNumber;
  String email;
  String username;
  String name;
  String companyId;
  int rating;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"] ?? json["Id"],
        avatar: json["avatar"] ?? json["Avatar"],
        phoneNumber: json["phoneNumber"] ?? json["PhoneNumber"],
        email: json["email"] ?? json["Email"],
        username: json["username"] ?? json["Username"],
        name: json["name"] ?? json["Name"],
        companyId: json["companyId"] ?? json["CompanyId"],
        rating: json["rating"] ?? json["Rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "phoneNumber": phoneNumber,
        "email": email,
        "username": username,
        "name": name,
        "companyId": companyId,
        "rating": rating
      };
}
