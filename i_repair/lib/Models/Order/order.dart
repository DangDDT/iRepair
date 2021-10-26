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
    this.customer,
    this.repairman,
    this.service,
    required this.orderHistories,
  });

  String id;
  String serviceId;
  String repairmanId;
  String customerId;
  DateTime createTime;
  dynamic paymentTime;
  int total;
  String customerAddress;
  int feedbackPoint;
  dynamic feedbackMessage;
  double lng;
  double lat;
  int status;
  dynamic customer;
  dynamic repairman;
  dynamic service;
  List<dynamic> orderHistories;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        serviceId: json["serviceId"],
        repairmanId: json["repairmanId"],
        customerId: json["customerId"],
        createTime: DateTime.parse(json["createTime"]),
        paymentTime: json["paymentTime"],
        total: json["total"],
        customerAddress: json["customerAddress"],
        feedbackPoint: json["feedbackPoint"],
        feedbackMessage: json["feedbackMessage"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        status: json["status"],
        customer: json["customer"],
        repairman: json["repairman"],
        service: json["service"],
        orderHistories:
            List<dynamic>.from(json["orderHistories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serviceId": serviceId,
        "repairmanId": repairmanId,
        "customerId": customerId,
        "createTime": createTime.toIso8601String(),
        "paymentTime": paymentTime,
        "total": total,
        "customerAddress": customerAddress,
        "feedbackPoint": feedbackPoint,
        "feedbackMessage": feedbackMessage,
        "lng": lng,
        "lat": lat,
        "status": status,
        "customer": customer,
        "repairman": repairman,
        "service": service,
        "orderHistories": List<dynamic>.from(orderHistories.map((x) => x)),
      };
}
