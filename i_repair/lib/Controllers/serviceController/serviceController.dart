import 'package:get/get.dart';
import 'package:i_repair/Models/Service/serviceDetail.dart';
import 'package:i_repair/Models/Field/field.dart' as field;
import 'package:i_repair/Services/api.services.dart';

class ServiceController extends GetxController {
  var isLoading = true.obs;
  var serviceList = List<ServiceDetail>.empty().obs;
  @override
  void onInit() {
    fetchService();
    super.onInit();
  }

  void fetchService() async {
    try {
      isLoading(true);
      var services = List<ServiceDetail>.empty().obs;
      serviceList.assignAll(services);
      print("fetchService() success");
    } finally {
      isLoading(false);
    }
  }

  void getServicesByField(field.Field field, double lat, double lng) async {
    try {
      isLoading(true);
      var services =
          await APIServices.fetchServicesByFieldAndLocation(field, lat, lng);
      serviceList.assignAll(services);
      print("getServicesByField() success");
    } finally {
      isLoading(false);
    }
  }
}
