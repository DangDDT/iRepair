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
    this.address,
    this.lng,
    this.lat,
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
  String? address;
  double? lat;
  double? lng;
  String uid;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        avatar: json["avatar"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        username: json["username"],
        createDate: DateTime.parse(json["createDate"]),
        fullName: json["fullName"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
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
        "address": address,
        "lat": lat,
        "lng": lng,
        "uid": uid,
      };
}
