import 'package:get/get.dart';
import 'package:i_repair/Services/api.services.dart';

import '../../Models/Major/major.dart';

class MajorController extends GetxController {
  var isLoading = true.obs;
  var majorList = List<Major>.empty().obs;

  @override
  // ignore: must_call_super
  void onInit() {
    super.onInit();
  }

  void fetchMajors() async {
    try {
      isLoading(true);
      var majors = await APIServices.fetchMajors();
      if (majors != null) {
        majorList.assignAll(majors);
      }
      print("fetchMajors() success");
    } finally {
      isLoading(false);
    }
  }
}
