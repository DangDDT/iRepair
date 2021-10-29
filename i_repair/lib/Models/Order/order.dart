class Order {
  Order({
    required this.id,
    required this.serviceId,
    required this.repairmanId,
    required this.customerId,
    required this.createTime,
    required this.paymentTime,
    required this.total,
    required this.customerAddress,
    required this.feedbackPoint,
    this.feedbackMessage,
    required this.lng,
    required this.lat,
    required this.status,
  });

  String id;
  String serviceId;
  String repairmanId;
  String customerId;
  String createTime;
  dynamic paymentTime;
  int total;
  String customerAddress;
  int feedbackPoint;
  dynamic feedbackMessage;
  double? lng;
  double? lat;
  int status;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["Id"] ?? json["id"],
        serviceId: json["ServiceId"] ?? json["serviceId"],
        repairmanId: json["RepairmanId"] ?? json["repairmanId"],
        customerId: json["CustomerId"] ?? json["customerId"],
        createTime: json["CreateTime"] ?? json["createTime"],
        paymentTime: json["PaymentTime"] ?? json["paymentTime"],
        total: json["Total"] ?? json["total"],
        customerAddress: json["CustomerAddress"] ?? json["customerAddress"],
        feedbackPoint: json["FeedbackPoint"] ?? json["feedbackPoint"],
        feedbackMessage: json["FeedbackMessage"] ?? json["feedbackMessage"],
        lng: json["Lng"] ?? json["lng"],
        lat: json["Lat"] ?? json["lat"],
        status: json["Status"] ?? json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServiceId": serviceId,
        "RepairmanId": repairmanId,
        "CustomerId": customerId,
        "CreateTime": createTime,
        "PaymentTime": paymentTime,
        "Total": total,
        "CustomerAddress": customerAddress,
        "FeedbackPoint": feedbackPoint,
        "FeedbackMessage": feedbackMessage,
        "lng": lng,
        "lat": lat,
        "Status": status,
      };
}
