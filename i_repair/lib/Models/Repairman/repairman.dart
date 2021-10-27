class Repairman {
  Repairman({
    required this.id,
    required this.uid,
    required this.avatar,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.username,
    required this.status,
    required this.companyId,
  });

  String id;
  String uid;
  String avatar;
  String name;
  String phoneNumber;
  String email;
  String username;
  int status;
  String companyId;

  factory Repairman.fromJson(Map<String, dynamic> json) => Repairman(
        id: json["Id"],
        uid: json["Uid"],
        avatar: json["Avatar"],
        name: json["Name"],
        phoneNumber: json["PhoneNumber"],
        email: json["Email"],
        username: json["Username"],
        status: json["Status"],
        companyId: json["CompanyId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Uid": uid,
        "Avatar": avatar,
        "Name": name,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Username": username,
        "Status": status,
        "CompanyId": companyId,
      };
}
