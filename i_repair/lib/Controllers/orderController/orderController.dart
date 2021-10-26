import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:i_repair/Models/Customer/customer.dart';
import 'package:i_repair/Models/Order/order.dart';
import 'package:i_repair/Services/api.services.dart';
import 'package:location/location.dart';

class OrderBloc with ChangeNotifier {
  bool isLoading = true;
  List<Order> _processingList = <Order>[];
  UnmodifiableListView<Order> get processingList =>
      UnmodifiableListView(_processingList);
  List<Order> _pendingList = <Order>[];
  UnmodifiableListView<Order> get pendingList =>
      UnmodifiableListView(_pendingList);
  List<Order> _waitingList = <Order>[];
  UnmodifiableListView<Order> get waitingList =>
      UnmodifiableListView(_waitingList);
  Location location = new Location();

  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? locationData;

  Customer? customer;

  OrderBloc() {
    getLocation();
  }

  getCustomer(String customerId) async {
    setLoading(true);
    this.customer = await APIServices.fetchCustomerById(customerId);
    if (this.customer != null) {
      setLoading(false);
    }
    notifyListeners();
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
  }

  getProcessingBookingList(String repairmanId) async {
    this._processingList = await APIServices.fetchOrders(repairmanId, 2);
    notifyListeners();
  }

  getPendingBookingList(String repairmanId) async {
    this._pendingList = await APIServices.fetchOrders(repairmanId, 1);
    notifyListeners();
  }

  getWaitingBookingList(String repairmanId) async {
    this._waitingList = await APIServices.fetchOrders(repairmanId, 0);
    notifyListeners();
  }

  void setLoading(val) {
    this.isLoading = val;
    notifyListeners();
  }
}
