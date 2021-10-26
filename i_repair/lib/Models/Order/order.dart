import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.serviceId,
    required this.repairmanId,
    required this.customerId,
    required this.createTime,
    this.paymentTime,
    required this.total,
    required this.customerAddress,
    required this.feedbackPoint,
    this.feedbackMessage,
    required this.status,
    required this.lat,
    required this.lng,
  });

  String id;
  String serviceId;
  String repairmanId;
  String customerId;
  DateTime createTime;
  DateTime? paymentTime;
  int total;
  String customerAddress;
  int feedbackPoint;
  dynamic feedbackMessage;
  int status;
  double lat;
  double lng;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["Id"],
        serviceId: json["ServiceId"],
        repairmanId: json["RepairmanId"],
        customerId: json["CustomerId"],
        createTime: DateTime.parse(json["CreateTime"]),
        paymentTime: json["PaymentTime"] == null
            ? null
            : DateTime.parse(json["PaymentTime"]),
        total: json["Total"],
        customerAddress: json["CustomerAddress"],
        feedbackPoint: json["FeedbackPoint"],
        feedbackMessage:
            json["FeedbackMessage"] == null ? null : json["FeedbackMessage"],
        status: json["Status"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServiceId": serviceId,
        "RepairmanId": repairmanId,
        "CustomerId": customerId,
        "CreateTime": createTime.toIso8601String(),
        "PaymentTime":
            paymentTime == null ? null : paymentTime!.toIso8601String(),
        "Total": total,
        "CustomerAddress": customerAddress,
        "FeedbackPoint": feedbackPoint,
        "FeedbackMessage": feedbackMessage == null ? null : feedbackMessage,
        "Status": status,
        "lat": lat,
        "lng": lng,
      };
}
