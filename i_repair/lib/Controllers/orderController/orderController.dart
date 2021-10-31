import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Services/api.services.dart';

class OrderDetailBloc with ChangeNotifier {
  bool isLoading = true;
  List<OrderDetail>? _processingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail>? get processingList =>
      UnmodifiableListView(_processingList!);
  List<OrderDetail>? _pendingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail>? get pendingList =>
      UnmodifiableListView(_pendingList!);
  List<OrderDetail> _historyList = <OrderDetail>[];
  List<OrderDetail>? get historyList {
    _historyList.sort((date1, date2) => DateTime.parse(date2.order.createTime!)
        .compareTo(DateTime.parse(date1.order.createTime!)));
    return _historyList;
  }

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

  cancelOrder(String id, String cancelReason) async {
    await APIServices.cancelOrder(id, cancelReason)
        .whenComplete(() => APIServices.cleanCache());
    notifyListeners();
  }

  getHistoryBookingList(String customerId) async {
    setLoading(true);
    this._historyList.clear();
    final completedList = await APIServices.fetchOrders(customerId, 3);
    final canceledList = await APIServices.fetchOrders(customerId, 2);
    if (completedList != null && canceledList != null) {
      this._historyList.addAll(completedList);
      this._historyList.addAll(canceledList);
    }
    setLoading(false);
    notifyListeners();
  }

  feedbackOrder(String id, int? feedbackPoint, String feedbackMessage) async {
    await APIServices.feedbackOrder(id, feedbackPoint, feedbackMessage)
        .whenComplete(() => APIServices.cleanCache());
    notifyListeners();
  }

  void setLoading(val) {
    this.isLoading = val;
  }
}
