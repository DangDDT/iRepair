import 'dart:convert';

import 'package:i_repair/Models/Company/company.dart';
import 'package:i_repair/Models/Customer/customer.dart';
import 'package:i_repair/Models/Field/field.dart';
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
    required this.customer,
    required this.field,
    required this.company,
  });

  Order order;
  Service service;
  Customer customer;
  Field field;
  Company company;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        order: Order.fromJson(json["Order"]),
        service: Service.fromJson(json["Service"]),
        customer: Customer.fromJson(json["Customer"]),
        field: Field.fromJson(json["Field"]),
        company: Company.fromJson(json["Company"]),
      );

  Map<String, dynamic> toJson() => {
        "Order": order.toJson(),
        "Service": service.toJson(),
        "Customer": customer.toJson(),
        "Field": field.toJson(),
        "Company": company.toJson(),
      };
}
