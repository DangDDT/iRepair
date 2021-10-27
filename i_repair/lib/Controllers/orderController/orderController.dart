import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Services/api.services.dart';

class OrderDetailBloc with ChangeNotifier {
  bool isLoading = true;
  List<OrderDetail> _processingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail> get processingList =>
      UnmodifiableListView(_processingList);
  List<OrderDetail> _pendingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail> get pendingList =>
      UnmodifiableListView(_pendingList);

  OrderBloc() {}

  getProcessingBookingList(String customerId) async {
    // setLoading(true);
    this._processingList = await APIServices.fetchOrders(customerId, 0);
    // setLoading(false);
    notifyListeners();
  }

  getPendingBookingList(String customerId) async {
    // setLoading(true);
    this._pendingList = await APIServices.fetchOrders(customerId, 1);
    // setLoading(false);
    notifyListeners();
  }

  createOrder(Order order) async {
    await APIServices.createOrder(order);
    notifyListeners();
  }
  // void setLoading(val) {
  //   this.isLoading = val;
  //   notifyListeners();
  // }
}
