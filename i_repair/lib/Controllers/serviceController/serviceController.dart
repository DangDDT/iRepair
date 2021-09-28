import 'package:get/get.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Models/Service/service.dart';
import 'package:i_repair/Services/api.services.dart';

class ServiceController extends GetxController {
  var isLoading = true.obs;
  var serviceList = List<Service>.empty().obs;

  @override
  // ignore: must_call_super
  void onInit() {
    fetchService();
    super.onInit();
  }

  void fetchService() async {
    try {
      isLoading(true);
      var services = await APIServices.fetchServices();
      serviceList.assignAll(services);
    } finally {
      isLoading(false);
    }
  }

  List<Service> getServicesByField(Field field) {
    List<Service> list = [];
    print(serviceList);
    for (Service service in serviceList) {
      if (service.fieldId == field.id) list.add(service);
    }
    // print(list);
    return list;
  }
}
