import 'package:get/get.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Services/api.services.dart';

class ServiceController extends GetxController {
  var isLoading = true.obs;
  var serviceList = List<Service>.empty().obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getServicesByField(Field field) async {
    try {
      isLoading(true);
      var services = await APIServices.fetchServicesByField(field);
      if (services != null) serviceList.assignAll(services);
      print("getServicesByField() success");
    } finally {
      isLoading(false);
    }
  }
}
