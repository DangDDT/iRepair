class Order {
  Order({
    this.id,
    required this.serviceId,
    this.repairmanId,
    required this.customerId,
    this.createTime,
    this.paymentTime,
    required this.total,
    required this.customerAddress,
    this.feedbackPoint,
    this.feedbackMessage,
    required this.lng,
    required this.lat,
    this.status,
    this.pendingReason,
    this.cancelReason,
  });

  String? id;
  String serviceId;
  String? repairmanId;
  String customerId;
  DateTime? createTime;
  dynamic paymentTime;
  int total;
  String customerAddress;
  int? feedbackPoint;
  dynamic feedbackMessage;
  double lng;
  double lat;
  int? status;
  dynamic pendingReason;
  dynamic cancelReason;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["Id"],
        serviceId: json["ServiceId"],
        repairmanId: json["RepairmanId"],
        customerId: json["CustomerId"],
        createTime: DateTime.parse(json["CreateTime"]),
        paymentTime: json["PaymentTime"],
        total: json["Total"],
        customerAddress: json["CustomerAddress"],
        feedbackPoint: json["FeedbackPoint"],
        feedbackMessage: json["FeedbackMessage"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        status: json["Status"],
        pendingReason: json["PendingReason"],
        cancelReason: json["CancelReason"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServiceId": serviceId,
        "RepairmanId": repairmanId,
        "CustomerId": customerId,
        "CreateTime": createTime!.toIso8601String(),
        "PaymentTime": paymentTime,
        "Total": total,
        "CustomerAddress": customerAddress,
        "FeedbackPoint": feedbackPoint,
        "FeedbackMessage": feedbackMessage,
        "lng": lng,
        "lat": lat,
        "Status": status,
        "PendingReason": pendingReason,
        "CancelReason": cancelReason,
      };
}
