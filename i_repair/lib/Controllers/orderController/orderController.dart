import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Customer/customer.dart';
import 'package:i_repair/Models/Order/orderDetail.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:location/location.dart';

class OrderDetailBloc with ChangeNotifier {
  bool isLoading = true;
  List<OrderDetail> _processingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail> get processingList =>
      UnmodifiableListView(_processingList);
  List<OrderDetail> _pendingList = <OrderDetail>[];
  UnmodifiableListView<OrderDetail> get pendingList =>
      UnmodifiableListView(_pendingList);
  Location location = new Location();

  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? locationData;

  Customer? customer;

  OrderBloc() {
    getLocation();
  }

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      // Use current location
      locationData = currentLocation;
    });
    location.enableBackgroundMode(enable: true);
    notifyListeners();
  }

  getProcessingBookingList(String repairmanId) async {
    setLoading(true);
    this._processingList = await APIServices.fetchOrders(repairmanId, 0);
    setLoading(false);
    notifyListeners();
  }

  getPendingBookingList(String repairmanId) async {
    setLoading(true);
    this._pendingList = await APIServices.fetchOrders(repairmanId, 1);
    setLoading(false);
    notifyListeners();
  }

  void setLoading(val) {
    this.isLoading = val;
    notifyListeners();
  }
}
