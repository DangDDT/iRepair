import 'package:get/get.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Services/api.services.dart';

import '../../Models/Major/major.dart';

class FieldController extends GetxController {
  var isLoading = true.obs;
  var fieldList = List<Field>.empty().obs;
  @override
  void onInit() {
    super.onInit();
  }

  void getFieldsByMajors(Major majors) async {
    try {
      isLoading(true);
      var fields = await APIServices.fetchFieldsByMajors(majors);
      if (fields != null) fieldList.assignAll(fields);
      print("fetchFieldsByMajors() success");
    } finally {
      isLoading(false);
    }
  }
}
