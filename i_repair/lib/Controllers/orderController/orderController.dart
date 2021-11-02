import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Services/api.services.dart';

class OrderDetailBloc with ChangeNotifier {
  bool isLoading = true;
  List<OrderDetail> _processingList = <OrderDetail>[];
  List<OrderDetail>? get processingList {
    _processingList.sort((date1, date2) =>
        DateTime.parse(date2.order.createTime!)
            .compareTo(DateTime.parse(date1.order.createTime!)));
    return _processingList;
  }

  List<OrderDetail> _historyList = <OrderDetail>[];
  List<OrderDetail>? get historyList {
    _historyList.sort((date1, date2) => DateTime.parse(date2.order.createTime!)
        .compareTo(DateTime.parse(date1.order.createTime!)));
    return _historyList;
  }

  OrderBloc() {}

  getProcessingBookingList(String customerId) async {
    setLoading(true);
    this._processingList.clear();
    final processingList = await APIServices.fetchOrders(customerId, 0);
    final pendingList = await APIServices.fetchOrders(customerId, 1);
    if (processingList != null && pendingList != null) {
      this._processingList.addAll(processingList);
      this._processingList.addAll(pendingList);
    }
    setLoading(false);
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

  getHistoryBookingList(String customerId, bool viewAll) async {
    setLoading(true);
    this._historyList.clear();
    final completedList = await APIServices.fetchOrders(customerId, 3);
    final canceledList = (viewAll)
        ? await APIServices.fetchOrders(customerId, 2)
        : <OrderDetail>[];
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
