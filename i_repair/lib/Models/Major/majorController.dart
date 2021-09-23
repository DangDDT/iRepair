import 'package:get/get.dart';
import 'package:i_repair/Models/api.services.dart';

import 'major.dart';

class MajorController extends GetxController {
  var isLoading = true.obs;
  var majorList = List<Major>.empty().obs;

  @override
  // ignore: must_call_super
  void onInit() {
    fetchMajor();
    super.onInit();
  }

  void fetchMajor() async {
    try {
      isLoading(true);
      var majors = await APIServices.fetchMajors();
      if (majors != null) {
        majorList.assignAll(majors);
      }
    } finally {
      isLoading(false);
    }
  }
}
