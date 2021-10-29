class Repairman {
  Repairman({
    required this.id,
    required this.avatar,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.status,
    required this.companyId,
  });

  String id;
  String avatar;
  String name;
  String phoneNumber;
  String email;
  String username;
  int status;
  String companyId;

  factory Repairman.fromJson(Map<String, dynamic> json) => Repairman(
        id: json["Id"] ?? json["id"],
        avatar: json["Avatar"] ?? json["avatar"],
        name: json["Name"] ?? json["name"],
        phoneNumber: json["PhoneNumber"] ?? json["phoneNumber"],
        email: json["Email"] ?? json["email"],
        username: json["Username"] ?? json["username"],
        status: json["Status"] ?? json["status"],
        companyId: json["CompanyId"] ?? json["companyId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Avatar": avatar,
        "Name": name,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Username": username,
        "Status": status,
        "CompanyId": companyId,
      };
}
