import 'dart:convert';

List<Tip> tipFromJson(String str) =>
    List<Tip>.from(json.decode(str).map((x) => Tip.fromJson(x)));

String tipToJson(List<Tip> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tip {
  Tip({
    this.imageUrl,
    this.title,
    this.content,
  });

  String? imageUrl;
  String? title;
  String? content;

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        imageUrl: json["imageUrl"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "title": title,
        "content": content,
      };
}
