import 'dart:convert';

import 'package:i_repair/Models/Company/company.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Repairman/repairman.dart';
import 'package:i_repair/Models/Service/service.dart';

import 'order.dart';

List<OrderDetail> orderDetailFromJson(String str) => List<OrderDetail>.from(
    json.decode(str).map((x) => OrderDetail.fromJson(x)));

String orderDetailToJson(List<OrderDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetail {
  OrderDetail({
    required this.order,
    required this.service,
    required this.repairman,
    required this.field,
    required this.company,
  });

  Order order;
  Service service;
  Repairman repairman;
  Field field;
  Company company;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        order: Order.fromJson(json["Order"]),
        service: Service.fromJson(json["Service"]),
        repairman: Repairman.fromJson(json["Repairman"]),
        field: Field.fromJson(json["Field"]),
        company: Company.fromJson(json["Company"]),
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "Service": service.toJson(),
        "Repairman": repairman.toJson(),
        "Field": field.toJson(),
        "Company": company.toJson(),
      };
}
