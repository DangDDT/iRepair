import 'package:get/get.dart';
import 'package:i_repair/Models/Field/field.dart';
import 'package:i_repair/Services/api.services.dart';

import '../../Models/Major/major.dart';

class FieldController extends GetxController {
  var isLoading = true.obs;
  var fieldList = List<Field>.empty().obs;
  @override
  void onInit() {
    fetchFields();
    super.onInit();
  }
  void fetchFields() async {
    try {
      isLoading(true);
      var fields = await APIServices.fetchFields();
      fieldList.assignAll(fields);
      print("fetchFields() success");
    } finally {
      isLoading(false);
    }
  }
  void getFieldsByMajors(List<Major> majors) async {
    try {
      isLoading(true);
      var fields = await APIServices.fetchFieldsByMajors(majors);
      fieldList.assignAll(fields);
      print("fetchFieldsByMajors() success");
    } finally {
      isLoading(false);
    }
  }
}
